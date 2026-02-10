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

## 🧭 Steps
### 🐳 Dockerfile

- [Dockerfile](./Dockerfile)

```bash
FROM python:3.9-slim AS builder
WORKDIR /app
COPY App/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY App/ .
EXPOSE 5000
CMD ["python", "app.py"]
```
### ▶️ Build Docker Image

```bash
docker build -t app -f Docker/Dockerfile .
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/53b295a0594c4949244db0571da394699961c129/Attachments/screenshots/build-image.png)

- Verify **Docker Images** :

  ![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/53b295a0594c4949244db0571da394699961c129/Attachments/screenshots/docker-images.png)

### ▶️ Run Docker Container
```bash
docker run -d -p 5000:5000 --name f-app app
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/53b295a0594c4949244db0571da394699961c129/Attachments/screenshots/run-con.png)

### 🌐 Verify Application
Once the container is running, the application can be accessed via:
```bash
http://localhost:5000
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/53b295a0594c4949244db0571da394699961c129/Attachments/screenshots/http.png)

---

## 📦 Deliverables
- Multi-stage Dockerfile
- Optimized Docker image
- Flask application running inside a container

---

## 🚀 Conclusion
By containerizing the application with Docker:
 - The application becomes portable and consistent across environments
 - It is optimized for performance and security
 - It is ready for integration with Jenkins CI and deployment to Kubernetes in the next stages of the project
