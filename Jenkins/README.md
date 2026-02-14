# 🚀 Jenkins Continuous Integration Pipeline
## 📂 Navigation
- [Main CI pipeline configuration](Jenkinsfile)
- [Jenkins Shared Library directory](../vars)
- [Application Docker build definition](../Docker/Dockerfile)
- [Kubernetes deployment manifest](../K8s/deployment.yaml)

---

## 🎯 Directory Purpose

This directory implements a complete **Continuous Integration (CI) pipeline** using Jenkins Declarative Pipeline and Shared Libraries.

The pipeline automates the container build, security scanning, registry push, and Kubernetes manifest update process.

It ensures that every change pushed to GitHub triggers an automated CI workflow.

---

## 🛠️ Pipeline Overview
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/90eb96f7315d3a78aa69630804e3a406c01cffb4/Attachments/screenshots/pipline-done.png)

It contains the following stages:

### 🏗 1️⃣ Build Image
- Builds the Docker image using the multi-stage Dockerfile.
- Uses Shared Library function:
```bash
dockerBuild(imageName)
```

### 🔍 2️⃣ Scan Image
- Scans the built image using Trivy.
- Detects HIGH and CRITICAL vulnerabilities.
- Fails the pipeline if severe vulnerabilities are found.
```bash
trivy image --severity HIGH,CRITICAL emanabosamra/app:latest
```

### 📦 3️⃣ Push Image
- Authenticates with Docker Hub.
- Pushes the image to:
```bash
emanabosamra/app:latest
```
Uses Jenkins credential:
```bash
dockerhub-creds
```

### 🧹 4️⃣ Delete Image Locally
- Removes the local Docker image after push.
- Keeps the Jenkins server clean.
- Uses Shared Library function:
```bash
dockerRemove(imageName)
```

### ☸️ 5️⃣ Update Manifests
- Updates Kubernetes deployment file automatically.
- Replaces the image tag inside:
```bash
K8s/deployment.yaml
```
Using:
```bash
sed -i 's|image: .*|image: emanabosamra/app:latest|' K8s/deployment.yaml
```

### 🔄 6️⃣ Push Manifests
- Commits updated Kubernetes manifest.
- Pushes changes back to GitHub repository.
- Uses Jenkins credential:
```bash
github-creds
```
This maintains a Git-based deployment workflow.

---


## 📚 Shared Library Usage
The pipeline uses a Jenkins Shared Library for reusable pipeline logic.
Library name: `jenkins-shared-library`
Repository structure:
```python
vars/
├── dockerBuild.groovy
├── dockerPush.groovy
└── dockerRemove.groovy
```
**🔹 dockerBuild.groovy:**
Encapsulates Docker build logic.

**🔹 dockerPush.groovy:**
Handles Docker registry push.

**🔹 dockerRemove.groovy:**
Removes local image after push.

- This improves:
  - Code reusability
  - Maintainability
  - Cleaner Jenkinsfile structure
 ---

 ## 🔐 Credentials Used
 - `dockerhub-creds` : Docker Hub authentication
 -  `github-creds` : GitHub push authentication
All credentials are securely stored in Jenkins.

---

## 📦 Deliverables
✔ Jenkinsfile is committed to the repository

✔ Shared Library directory `vars` is committed to the repository

Both are version-controlled in GitHub.

---

