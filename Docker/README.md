# 🐳 Flask Application Containerization with Docker

## 📂 Navigation
- [Dockerfile](./Dockerfile)
- [Application Source Code ](CloudDevOpsProject/App)

---

## 🎯 Overview
This directory demonstrates how a Flask web application is containerized using Docker with a multi-stage build approach.
The goal is to create a lightweight, efficient, and production-ready Docker image that can be easily integrated into CI/CD pipelines and later deployed to Kubernetes.
The application runs on port 5000 and is designed to be portable across different environments.

---

## 🛠️ Key Docker Features
### ✅ Base Verified Images
- The Dockerfile uses an official and trusted Python image from Docker Hub:
  - `python:3.9-slim`
- This ensures:
  - Smaller image size
  - Better security
  - Long-term stability

### 🏗️ Multi-Stage Build
- **multi-stage Docker build** is used to optimize the final image:
  - **Stage 1: Builder:**
    - Installs application dependencies from requirements.txt
    - Uses build tools only when needed
    - Stores dependencies separately from the application code
  - **Stage 2: Runtime:**
    - Uses a clean and minimal Python image
    - Copies only the required dependencies from the builder stage
    - Copies the application source code
    - Runs the Flask application
- This approach ensures Reduced attack surface, Faster startup time, and production-ready images.

---


