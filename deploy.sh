#!/bin/bash
set -e

cd /home/ubuntu/rewire

IMAGE_TAG=$1
WORKERS_PRIVATE_IP=$2
ACTIVE=$(cat .active_env 2>/dev/null || echo "")
TARGET=$([ "$ACTIVE" = "blue" ] && echo "green" || echo "blue")

echo "🎉 Deploying From $ACTIVE to $TARGET with tag $IMAGE_TAG"

echo "🔗 Ensuring network exists..."
docker network inspect rewire_proxy >/dev/null 2>&1 || docker network create rewire_proxy

echo "🚀 Deploying to $TARGET with tag $IMAGE_TAG"
export IMAGE_TAG=$IMAGE_TAG

docker compose -p rewire-$TARGET -f docker-compose.$TARGET.yml pull
docker compose -p rewire-$TARGET -f docker-compose.$TARGET.yml up -d

echo "⏳ Waiting for containers..."
sleep 10

echo "🔗 Ensuring Caddy is running..."
if ! docker ps --format '{{.Names}}' | grep -q "^caddy$"; then
    docker compose -f docker-compose.proxy.yml up -d
fi

echo "🩺 Health check..."
if docker exec frontend_${TARGET} wget -q --spider http://localhost:3000/login; then
    if docker exec backend_${TARGET} curl -f http://localhost:8000/api/health > /dev/null 2>&1; then

        echo "✅ Health OK"

        echo "📦 Running Laravel tasks..."
        docker exec backend_${TARGET} php artisan migrate --force
        docker exec backend_${TARGET} php artisan optimize:clear
        docker exec backend_${TARGET} php artisan optimize

        echo "🔁 Switching traffic to $TARGET..."

        if docker ps --format '{{.Names}}' | grep -q "^backend_${ACTIVE}$"; then
            docker network disconnect rewire_proxy backend_${ACTIVE} || true
            docker network connect rewire_proxy backend_${ACTIVE} || true
        fi

        if docker ps --format '{{.Names}}' | grep -q "^frontend_${ACTIVE}$"; then
            docker network disconnect rewire_proxy frontend_${ACTIVE} || true
            docker network connect rewire_proxy frontend_${ACTIVE} || true
        fi

        docker network disconnect rewire_proxy backend_${TARGET} || true
        docker network disconnect rewire_proxy frontend_${TARGET} || true

        docker network connect --alias backend_active rewire_proxy backend_${TARGET}
        docker network connect --alias frontend_active rewire_proxy frontend_${TARGET}

        echo "🧹 Cleaning old environment..."
        docker compose -p rewire-$ACTIVE -f docker-compose.$ACTIVE.yml down -v --remove-orphans

        docker image prune -af

        echo "🚀 Deploying WORKERS in background..."

        ssh -i /home/ubuntu/rewire-worker-server.pem ubuntu@$WORKERS_PRIVATE_IP << EOF
            # These commands now run INSIDE the worker server
            cd /home/ubuntu/rewire
            
            echo "🔗 Ensuring network exists..."
            docker network inspect rewire_proxy >/dev/null 2>&1 || docker network create rewire_proxy

            # We pass the IMAGE_TAG variable through the heredoc
            export IMAGE_TAG=$IMAGE_TAG
            export TARGET=$TARGET

            echo "🐳 Pulling and starting containers for \$TARGET..."
            docker compose -p rewire-workers-\$TARGET -f docker-compose.workers.\$TARGET.yml pull
            docker compose -p rewire-workers-\$TARGET -f docker-compose.workers.\$TARGET.yml up -d

            echo "⏳ Waiting for containers..."
            sleep 10

            if docker ps --format '{{.Names}}' | grep -q "^evaluation_worker_\$TARGET$"; then
                if docker ps --format '{{.Names}}' | grep -q "^problems_worker_\$TARGET$"; then

                    echo "🧹 Cleaning old environment..."
                    docker compose -p rewire-workers-$ACTIVE -f docker-compose.workers.$ACTIVE.yml down -v --remove-orphans
                    docker image prune -af

                    echo "✅ Workers are running"
                    exit 0
                else
                    echo "❌ Problems worker failed"
                    exit 1
                fi
            else
                echo "❌ Evaluation worker failed"
                exit 1
            fi
EOF

        if [ $? -eq 0 ]; then

            echo $TARGET > .active_env
            
            echo "🎉 Deploy successful!"
            exit 0
        else
            echo "❌ Deployment failed on worker server."
            exit 1
        fi

    else
        echo "❌ Backend failed"
        exit 1
    fi
else
    echo "❌ Frontend failed"
    exit 1
fi