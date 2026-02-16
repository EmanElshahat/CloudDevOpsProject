# 🚀 Cloud DevOps Project – End-to-End CI/CD with GitOps
## 🎯 Project Overview
- Cloud Provider: **AWS**
- Containerization: **Docker**
- Kubernetes Cluster: **K3s (Lightweight Kubernetes)**
- IaC: **Terraform (Modules + S3 Backend)**
- Configuration Management: **Ansible**
- CI: **Jenkins (Shared Library)**
- GitOps CD: **ArgoCD**
- Container Registry: **Docker Hub**
- Security Scanning: **Trivy**

---
## 🏗️ Infrastructure Architecture
![Pipeline](https://github.com/EmanElshahat/CloudDevOpsProject/blob/c3acc03e601a9c2a673c336962f20694bae5124f/Attachments/diagram/Infrastructure%20Architecture.gif)

---

## 🔄 CI/CD Pipeline Flow
![Pipeline](https://github.com/EmanElshahat/CloudDevOpsProject/blob/c642c8ab86e0add7161d92a90c27bdfc40e8a3e9/Attachments/diagram/CICD%20Pipeline.gif)

---
## 🏗️ Repository Structure
- [App](App) – Flask application source code
- [vars](vars) – Jenkins Shared Library (Groovy functions)
- [Docker](Docker) – Multi-stage Dockerfile
- [K8s](K8s) – Kubernetes deployment and service manifests
- [Terraform](Terraform) – Infrastructure as Code (VPC, Subnet, IGW, Security Groups, EC2, IAM, S3 Backend, Modules)
- [Ansible](Ansible) – EC2 configuration, Jenkins installation, roles, dynamic inventory
- [Jenkins](Jenkins) – CI pipeline definition
- [ArgoCD](ArgoCD) – ArgoCD Application manifest for GitOps deployment

---
## 🧩 Introduction
This project demonstrates a complete end-to-end DevOps pipeline that provisions infrastructure, configures servers, builds and scans Docker images, and deploys applications to Kubernetes using GitOps principles.
The application consists of:
- A containerized **Flask web application**
- Docker image pushed to **Docker Hub**
- Kubernetes deployment manifests
- GitOps-based deployment using **ArgoCD**
Beyond application deployment, this project demonstrates a full DevOps lifecycle using modern cloud-native tools:
- **Terraform** provisions AWS infrastructure including:
  - VPC
  - Public Subnet
  - Internet Gateway
  - Route Tables
  - Security Groups
  - EC2 instance
  - IAM Role for CloudWatch
  - S3 remote backend for Terraform state
  - Modular structure (Network Module & Server Module)
- **Ansible** configures the EC2 instance:
  - Installs Docker, Git, Java
  - Installs and configures Jenkins
  - Uses Roles
  - Uses Dynamic Inventory
- **Jenkins** orchestrates CI pipeline:
  - Build Docker image
  - Scan image with Trivy
  - Push image to Docker Hub
  - Remove local image
  - Update Kubernetes manifests
  - Push manifests to GitHub
  - Uses Shared Library (vars directory)
- **ArgoCD** enables GitOps Continuous Deployment:
  - Watches Git repository
  - Automatically syncs manifests
  - Deploys updated images to Kubernetes cluster
This project showcases real-world DevOps practices including Infrastructure as Code, CI/CD automation, container security scanning, Kubernetes deployment, and GitOps workflows.
  
---

## 🧠 Problems Faced

### 🔴 Problem 1: IAM Role Creation Failed (AWS Academy Sandbox)
Error:
```bash
AccessDenied: iam:CreateRole
```
- **Solution:**

  Verified configuration works in full-permission AWS account.
  Identified sandbox IAM restrictions.
- **Why:**

  AWS Academy sandbox limits IAM permissions like `iam:CreateRole`.
### 🔴 Problem 2: Trivy Not Installed
Error:
```bash
trivy: command not found
```
- **Solution:**
  Installed Trivy manually on Jenkins EC2 instance.

- **Why:**
  Pipeline required Trivy binary for image scanning.

### 🔴 Problem 3: Kubernetes Authentication Issue
kubectl returned authentication required error.
- **Solution:**

```bash
sudo /usr/local/bin/kubectl
```
- **Why:**

K3s installs kubeconfig with restricted permissions.


