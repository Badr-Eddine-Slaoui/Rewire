# 🚀 Rewire — Automated Grading System

## 🧠 Overview

**Rewire** is an automated grading platform designed to replace traditional manual evaluation methods with a scalable, objective, and real-time system.

It evaluates:

* Full project repositories (architecture + functionality)
* Algorithmic problem-solving skills
* Student progression based on defined skill levels

The platform integrates **DevOps, distributed systems, and AI-powered feedback** to deliver a complete evaluation experience.

---

## 🎯 Purpose

Traditional evaluation methods rely heavily on manual correction, which is:

* Time-consuming
* Subjective
* Not scalable

**Rewire** solves this by:

* Automating repository analysis
* Running test cases in isolated environments
* Generating structured feedback using AI
* Providing consistent, data-driven grading

---

## 🏗️ System Architecture

### ⚙️ Core Infrastructure

* **Backend**: Laravel (Octane + FrankenPHP)
* **Frontend**: Nuxt.js
* **Reverse Proxy**: Caddy
* **Database**: PostgreSQL (AWS RDS)
* **Queue System**: Redis Pub/Sub (AWS ElastiCache)
* **Compute**: AWS EC2 Instances
* **Containers**: Docker

---

### 🧩 Services

#### 1. Main Application Server

* Handles API requests
* Stores submissions
* Publishes jobs to Redis
* Sends emails & AI feedback

---

#### 2. Evaluation Workers (Go Services)

**Worker 1 — Repository Evaluation**

* Subscribes to submission events
* Clones student repository
* Spins Docker container (based on selected stack)
* Runs:

  * Architecture validation
  * Functional test cases
* Computes score (out of 10)
* Stores:

  * Missing files
  * Failed tests
  * Validation result

---

**Worker 2 — Problem Evaluation**

* Processes problem submissions
* Spins isolated containers per problem
* Runs all test cases in parallel
* Computes per-problem scores
* Stores failed test cases
* Cleans up containers after execution

*Note: The design of the problem evaluation workflow was inspired in part by concepts from the SudoCode platform developed by Houssam Mirrou.*

---

### 🤖 AI Feedback System

After evaluation:

* System aggregates:

  * Project results
  * Problem results
  * Failed test cases
  * Missing architecture elements
* Sends structured prompt to AI (Gemini API)
* Generates:

  * Motivation message
  * Weakness analysis
  * Improvement suggestions

---

## 👥 Roles & Responsibilities

### 🛠️ Admin

* Manages:

  * Academic structure (Years → Levels → Formations → Groups)
  * Users (Students / Teachers)
  * Skills & Levels
  * Sprints & Skill Mapping
  * Programming Languages (Docker Images)
  * Runners & Runner Versions
  * Tech Stacks

---

### 👨‍🏫 Teacher

* Creates:

  * Briefs (assignments)
  * Brief versions:

    * Architecture rules
    * Test configurations
  * Problems with test cases
* Links:

  * Skills → Required levels
  * Briefs → Sprints → Tech stacks

---

### 🎓 Student

* Receives assigned briefs
* Submits project repository
* Solves problems in integrated editor
* Receives:

  * Automated grading
  * Skill-based evaluation
  * AI-generated feedback

---

## 🔄 Evaluation Flow

### 📦 Project Submission

1. Student submits repository link
2. Backend stores submission
3. Job published to Redis
4. Worker evaluates:

   * Architecture
   * Test cases
5. Score generated
6. Results stored
7. Student notified

---

### 🧪 Problem Submission

1. Student submits solutions
2. Backend stores answers
3. Job published to Redis
4. Worker:

   * Runs all problems in parallel
   * Executes all test cases
5. Scores calculated
6. Results stored

---

### 🤖 Final Feedback

1. Backend aggregates all results
2. Sends prompt to AI
3. Generates:

   * Feedback message
   * Weakness points
   * Suggestions
4. Final score calculated:

   * < 7 → Failed
   * ≥ 7 → Passed

---

## 🔒 Access & License

This repository is **private and proprietary**.

* Access is granted strictly for **evaluation and review purposes**
* No rights to use, copy, modify, or distribute the code are granted
* All rights remain with the author

See the `LICENSE` file for full legal terms.

---

## 🧪 Key Features

* ⚡ Automated repository evaluation
* 🐳 Docker-based isolated execution
* 📊 Skill-based grading system
* 🔄 Distributed job processing
* 🧠 AI-generated feedback
* 📈 Scalable architecture (AWS-based)

---

## 💡 Why "Rewire"?

Because it **rewires** the way education evaluates developers:

* From subjective → objective
* From manual → automated
* From slow → real-time

---

## 🤝 Acknowledgment

Part of the problem evaluation approach in **Rewire** was inspired by the work of my classmate **Houssam Mirrou** and his competitive programming platform **SudoCode**.

His contribution played an important role in shaping the evaluation logic, especially in the design of problem-based testing workflows.

🔗 GitHub: https://github.com/houssam-mirrou
🔗 Project: SudoCode (Private Repository)

This acknowledgment is made with full respect and appreciation for his work.

---

## 👤 Author

**Badr Eddine Slaoui**
Full-Stack Developer

---

## 📌 Note

This project is shared under restricted access for review and evaluation purposes only.
Any unauthorized use or reproduction is strictly prohibited.
