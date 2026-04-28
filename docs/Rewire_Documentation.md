# Rewire Platform - Comprehensive Documentation

Welcome to the definitive documentation for the **Rewire Platform**. This document aggregates the complete technical, architectural, and operational details spanning the Backend API, Frontend interfaces, and dedicated Go execution workers.

---

## 1. Executive Summary & Overview

**Rewire** is a sophisticated, containerized educational management and automated evaluation platform. It is designed to handle the entire lifecycle of a tech academy or coding bootcamp. The platform facilitates:
- **Hierarchical Academic Management:** Organizing Scholar Years, Grade Levels, Formations, and Class Groups.
- **Project-Based Learning (Briefs):** Allowing teachers to assign complex projects that students complete by submitting GitHub repositories. These repositories are then executed and graded automatically by isolated Docker workers.
- **Algorithmic Challenges (Problems):** LeetCode-style coding challenges with hidden test cases executed and scored instantaneously.
- **Role-Based Workspaces:** Distinct, secure interfaces for Administrators, Teachers, and Students.

---

## 2. Infrastructure & Technical Stack

Rewire leverages a modern, microservices-oriented architecture:
- **Frontend:** Nuxt.js (Vue 3) utilizing Pinia for robust state management and TailwindCSS for responsive UI design.
- **Backend API:** Laravel 11/10 optimized with FrankenPHP (via Laravel Octane) to deliver lightning-fast API responses.
- **Database Layer:** PostgreSQL for persistent relational data; Redis for high-speed caching and critical Pub/Sub messaging.
- **Execution Workers:** Custom-built **Go applications** (`worker` and `problems_worker`) operating via Docker-in-Docker (DinD) to safely evaluate untrusted student code.
- **Reverse Proxy / Server:** Caddy server handling seamless HTTP/HTTPS routing.

---

## 3. Frontend Architecture (Nuxt.js)

The frontend application is strictly typed and component-driven, providing dynamic routing based on user roles.

### 3.1. Pages, Routing & Workspaces
The `frontend/app/pages/` directory dictates the application's routing structure:
- **Guest / Auth:** `/Login` serves as the entry point for authentication.
- **Admin Workspace (`/admin/*`):** A comprehensive CMS-style interface. Provides data tables with pagination (`admin/class/index.vue`, `admin/formation/index.vue`, etc.) and extensive CRUD forms for managing infrastructure (Stacks, Runners, Languages) and academic hierarchies (Scholar Years, Grade Levels, Skills, Sprints).
- **Teacher Workspace (`/teacher/*`):** Interfaces tailored for educators. Allows creation of complex assignment architectures (`teacher/brief/create.vue`), configuration of algorithmic problem test cases (`teacher/problems/create.vue`), and manual grading dashboards (`teacher/submission/index.vue`).
- **Student Workspace (`/student/*`):** Focuses on task delivery. Students can view available Briefs (`student/briefs/index.vue`), submit GitHub repositories (`student/submission/[id]/create.vue`), and review detailed AI/Worker corrections and scores (`student/correction/index.vue`).

### 3.2. State Management (Pinia Stores)
The `frontend/stores/` directory handles global application state, caching, and API interactions via custom utility wrappers (`useApi`).
- **Core Stores:** `auth.ts` (handles JWT, session persistence, login/logout), `toast.ts` (manages global UI notifications).
- **Entity Stores:** Every backend module has a dedicated store (`brief.ts`, `class_group.ts`, `problem_submission.ts`, `runner.ts`, `skill.ts`, etc.) exporting asynchronous actions (e.g., `fetchBriefs`, `restoreSkill`, `archiveFormation`) to ensure the UI remains reactive to API mutations.

### 3.3. Type Definitions & Middleware
- **Types (`frontend/types/`):** Ensures end-to-end type safety. Key interfaces like `Brief`, `BriefVersion`, `Correction`, `User`, `Problem`, and `Submission` define strict payloads that map exactly to the backend database schemas.
- **Middleware (`frontend/app/middleware/`):** Strict route guards enforce security:
  - `auth.ts` / `guest.ts`: Validates JWT token presence.
  - `admin.ts`, `teacher.ts`, `student.ts`: Inspects the decoded JWT payload to enforce Role-Based Access Control (RBAC), redirecting unauthorized users instantly.

---

## 4. Backend Architecture & Background Workers

The backend is structurally split between the Laravel HTTP API and the asynchronous Go workers.

### 4.1. Core API (Laravel Controllers)
Located in `backend/app/Http/Controllers/Api/`, the Laravel application serves as the central brain:
- **CRUD Operations:** Over 28 modular controllers (e.g., `ScholarYearController`, `BriefController`, `SubmissionController`) handle complex business logic and database queries using Eloquent ORM.
- **Validation:** Utilizes strict `FormRequest` classes (e.g., `FormationRequest`, `UserRequest`) to enforce data integrity before any database interaction.
- **Event Dispatching:** Controllers such as `ProblemSubmissionController` and `SubmissionController` don't block the HTTP request. Instead, they persist the submission state as "pending" and dispatch messages to Redis Pub/Sub channels to trigger the Go workers.

### 4.2. General Project Evaluation Worker (`worker/`)
A highly secure, async Go application designed to evaluate full project submissions (e.g., a Vue.js or Laravel project).
- **Trigger:** Subscribes to the `evaluation.jobs.created` Redis channel.
- **Execution Flow:** 
  1. Receives Job ID, fetches configuration (Docker Image, Resource Limits) via internal HTTP.
  2. Utilizes internal Git tools to clone the student's repository into a temporary `/tmp/job_<ID>` folder.
  3. Spins up a secure, isolated Docker container executing the student's code. It enforces strict hardware limits (`CPU`, `MemoryMB`, `PIDsLimit`) to prevent malicious infinite loops or memory leaks from crashing the host server.
  4. Parses the generated `result.json` file, posts the final grade/status back to Laravel, and rigorously cleans up the temporary directories.

### 4.3. Algorithmic Problems Worker (`problems_worker/`)
A fast, lightweight Go application built for instantaneous LeetCode-style code evaluation.
- **Trigger:** Subscribes to the `problem.submissions.jobs.created` Redis channel.
- **Execution Flow:**
  1. Fetches the student's raw code submission and the hidden array of teacher-defined test cases.
  2. Executes the code and captures the standard output.
  3. Uses a sophisticated, dynamic `compareOutput()` algorithm that smartly normalizes types (e.g., treating whole-number floats as integers and stripping whitespace) to accurately compare the student's output against the `ExpectedOutput`.
  4. Calculates a percentage score out of 10, generates a detailed payload indicating precisely which test cases passed/failed, and instantly updates the Laravel backend.

---

## 5. Comprehensive API Reference

The platform features a massive, standardized RESTful API. Every endpoint expects and returns JSON, utilizing Bearer Tokens for authorization.

### 5.1. Authentication
- `POST /api/login`: Validates `email` and `password`, returning a JWT.
- `GET /api/me` / `POST /api/logout`: Manages the active session.

### 5.2. Admin Endpoints
Admins have unrestricted access to define the platform's infrastructure. Most entities follow full standard CRUD + Restore/Archive patterns:
- **Academic Hierarchy:** `/api/admin/scholar-years`, `/api/admin/grade-levels`, `/api/admin/formations`, `/api/admin/class-groups`.
- **Taxonomy:** `/api/admin/levels`, `/api/admin/skills`, `/api/admin/sprints`.
- **Infrastructure Setup:** `/api/admin/runners`, `/api/admin/runner-versions`, `/api/admin/stacks`, `/api/admin/languages`.
- **User Management:** `/api/admin/users`, including fetching specific roles via `/api/admin/users/main_teachers/{class_group}`.

### 5.3. Teacher Endpoints
Teachers manage the educational content delivery:
- **Briefs (Projects):** `/api/teacher/brief` (Create assignments, attach taxonomy skills).
- **Problems (Algorithms):** `/api/teacher/problems` (Define coding challenges and expected IO test cases).
- **Grading:** `/api/teacher/submission` (View incoming student work, apply manual grades via the Correction system).

### 5.4. Student Endpoints
Students interact with read-heavy and submission endpoints:
- **Dashboard:** `/api/student` (Fetches aggregated stats and progress).
- **Assignments:** `/api/student/briefs` (Lists active assigned projects).
- **Submitting Work:** `/api/student/submission/{id}/create` (Submits a GitHub repo link or code blocks for asynchronous evaluation).
- **Corrections:** `/api/student/correction` (Fetches the final Worker-generated or Teacher-generated feedback).

---

## 6. Local Setup & Deployment

### 6.1. Prerequisites
- Docker & Docker Compose installed.
- Ensure ports `80`, `3000`, `8000`, `5432`, `6379`, `8080` are available on your host machine.

### 6.2. Installation Steps
1. **Clone the Repository.**
2. **Environment Configuration:**
   - Duplicate `.env.example` to `.env` in the root directory.
   - Duplicate `backend/.env.example` to `backend/.env`.
   - Setup `worker/.env` and `problems_worker/.env` to point to the local Redis instance.
3. **Start the Infrastructure:**
   Navigate to the root directory and build the containers:
   ```bash
   docker compose up -d --build
   ```
4. The platform will automatically provision PostgreSQL, start Redis, serve the Nuxt frontend, spin up FrankenPHP for the Laravel API, and initialize the Go background workers in standby mode.

*(End of Documentation)*
