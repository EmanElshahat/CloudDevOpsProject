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
## ⚙️ Infrastructure Architecture
![Infrastructure](https://github.com/EmanElshahat/CloudDevOpsProject/blob/d9dc67562529c4ebaa6d22d3d33fb26fbac384d1/Attachments/diagram/Infrastructure%20Architecture.gif)

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

## 🚀 Step-by-Step Deployment

### 1. Application Development & Repository Setup
- Cloning the Flask application from the GitHub repository.

### 2. Dockerizing the Application
- Creating a multi-stage Dockerfile for the Flask application.
- Building the Docker image locally for testing.
- Running the container on port `5000` and exposing it via `8000` on EC2.
- 
### 3. Provisioning AWS Infrastructure with Terraform
- Using Terraform Modules (Network & Server) to provision:
  - VPC ,Public Subnet ,Internet Gateway (IGW) ,Internet Gateway (IGW) ,Security Groups
  - EC2 instance for Jenkins & CI/CD
  - IAM Role for EC2 (CloudWatch access)
  - S3 backend for remote Terraform state storage
  - S3 backend for remote Terraform state storage
- Terraform state is stored remotely in an S3 bucket for better state management and collaboration.

### 4. Configuring EC2 Instance with Ansible
- Using Ansible with:
  - Dynamic Inventory (based on Terraform outputs)
  - Roles for modular configuration
- Roles for modular configuration
  - Git
  - Docker
  - Java
  - Jenkins
- Ensuring Jenkins is properly installed and accessible via public IP.

### 5. Setting Up Continuous Integration with Jenkins
- Creating a declarative Jenkins pipeline using:
  - [Shared Library](vars)
  - Multiple CI stages:
    - Build Image
    - Scan Image (Trivy Security Scan)
    - Push Image (Docker Hub)
    - Delete Image Locally
    - Update Kubernetes Manifests
    - Update Kubernetes Manifests
- Integrating:
  - Docker Hub credentials
  - GitHub credentials
  - Trivy vulnerability scanner

### 6. Continuous Deployment with ArgoCD (GitOps)
- Installing k3s Kubernetes cluster on EC2.
- Deploying ArgoCD inside the cluster.
- Creating an ArgoCD Application manifest to:
  - Watch the GitHub repository
  - Detect changes in Kubernetes manifests
  - Automatically sync updates to the cluster
  - Deploy updated Docker images to Kubernetes pods
- User traffic flows:
  - Internet → Public IP → k3s → Pod

## 🎯 Conclusion
### This project demonstrates a complete end-to-end DevOps pipeline
- Infrastructure as Code
- Configuration Management
- Continuous Integration
- Container Security Scanning
- GitOps-based Continuous Deployment
- Cloud-native container orchestration
By integrating Terraform, Ansible, Jenkins, Docker, Trivy, Kubernetes, and ArgoCD, this project delivers a fully automated, production-style deployment workflow on AWS.
### It showcases real-world DevOps engineering practices and provides a scalable foundation for future cloud-native applications.
