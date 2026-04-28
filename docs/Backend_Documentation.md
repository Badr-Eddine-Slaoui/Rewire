# Backend Architecture & Functionalities Documentation

This document outlines the architecture, components, and functionalities of the Rewire platform's backend infrastructure, which consists of the main API server and two specialized background worker applications.

---

## 1. Core API Backend (`backend/app/Http/Controllers/Api`)

The core backend is built using Laravel (PHP) and handles all HTTP requests from the Nuxt.js frontend. It acts as the central source of truth, managing the database (PostgreSQL), authentication, business logic, and orchestrating background tasks.

### Main Modules & Functionalities:

#### Admin & Master Data Management
Controllers handling the structural setup of the platform.
- **`ScholarYearController`**, **`GradeLevelController`**, **`FormationController`**, **`ClassGroupController`**: Manage the academic hierarchy, creating years, formations (e.g., Software Engineering), and assigning classes to them.
- **`UserController`**: Handles CRUD operations for Admins, Main Teachers, Sub Teachers, and Students.
- **`LevelController`**, **`SkillController`**, **`SprintController`**: Define the taxonomy of skills taught in the curriculum and map them to specific timeframes (Sprints).
- **`RunnerController`**, **`StackController`**, **`LanguageController`**: Configure the environments (Docker images, versions, supported languages) used by the background workers to execute student code.

#### Teacher Workspace
Controllers allowing educators to manage assignments and grades.
- **`BriefController`** & **`BriefVersionController`**: Allow teachers to create project assignments (Briefs), attach specific skill levels, and manage iterations of those projects.
- **`ProblemController`** & **`ProblemTestCaseController`**: Enable teachers to create algorithmic coding challenges (similar to LeetCode) and define hidden input/output test cases for automated grading.
- **`CorrectionController`**: Handles the manual grading process where teachers evaluate student submissions for Briefs.

#### Student Workspace
Controllers for the student-facing interface.
- **`StudentController`**: Aggregates data for the student dashboard.
- **`SubmissionController`**: Allows students to submit their work (GitHub links or files) for project Briefs.
- **`ProblemSubmissionController`**: Receives student code for algorithmic problems. Upon receiving code, this controller persists the submission and **dispatches an event to Redis** to trigger the background worker for automated evaluation.

#### Worker Orchestration
- **`EvaluationJobController`** & **`ProblemSubmissionJobController`**: Dedicated internal endpoints used securely by the Go workers to fetch job configurations and post the final execution results back to the database.

---

## 2. General Evaluation Worker (`worker/`)

Written in **Go**, this worker is responsible for securely executing, testing, and evaluating full project repositories (e.g., a student's React or Laravel project).

### Architecture & Workflow:
1. **Subscription:** Starts up and subscribes to the Redis Pub/Sub channel `evaluation.jobs.created`.
2. **Job Fetching:** When a job ID is received, it queries the Laravel backend via HTTP to retrieve the job configuration, which includes the Git repository URL, the required Docker Runner image, and resource limits.
3. **Cloning:** Uses internal Git utilities to clone the student's repository into a temporary directory (`/tmp/job_<ID>`).
4. **Execution (Docker-in-Docker):**
   - Spawns an isolated Docker container based on the job's `Runner.Image`.
   - Mounts the cloned repository and configuration into the container.
   - Enforces strict resource constraints defined by the teacher (e.g., `CPU`, `MemoryMB`, `TimeoutSeconds`, `PIDsLimit`) to prevent malicious code from crashing the host.
5. **Result Processing:** Waits for the container to finish executing the test suite and generating a `result.json` file.
6. **Reporting & Cleanup:** Reads the JSON result, posts it back to the Laravel backend via HTTP, and aggressively cleans up the `/tmp` directories to free up disk space.

---

## 3. Algorithmic Problems Worker (`problems_worker/`)

Also written in **Go**, this specialized worker handles the instantaneous evaluation of LeetCode-style algorithmic submissions.

### Architecture & Workflow:
1. **Subscription:** Listens to the Redis Pub/Sub channel `problem.submissions.jobs.created`.
2. **Job Fetching:** Retrieves the student's submitted code and the hidden test cases defined by the teacher from the backend.
3. **Execution & Dynamic Evaluation:**
   - Iterates through every submitted problem and its associated test cases.
   - Uses the internal `runner.ExecuteTest` to execute the student's code securely.
   - **Smart Comparison:** Uses a robust, dynamic comparison algorithm (`compareOutput()`) to match the actual standard output against the expected output. It handles type normalization (e.g., treating `float64` without decimals as `int`) and spacing variations to ensure fair grading.
4. **Scoring:** Calculates a final score out of 10 based on the percentage of test cases passed.
5. **Reporting:** Constructs a detailed payload showing exactly which test cases passed or failed (including actual vs. expected outputs) and pushes it to the backend, where it is instantly visible to the student.
