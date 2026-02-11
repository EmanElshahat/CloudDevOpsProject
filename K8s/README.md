# ☸️ Container Orchestration with Kubernetes
## 📂 Navigation
- [Namespace Configuration](namespace.yaml)
- [Deployment Configuration](deployment.yaml)
- [Service Configuration](service.yaml)

---
## 🎯 Overview
This directory contains all Kubernetes manifests required to deploy and manage the Flask application inside a Kubernetes cluster.
Kubernetes is used to orchestrate containers, ensure high availability, manage scaling, and expose the application through a stable network interface.
The application is deployed inside a dedicated namespace to maintain isolation and follow best practices.

---
## 🧱 Kubernetes Components
### 📌 Namespace
A dedicated namespace named **ivolve** is created to logically isolate all project resources within the cluster.
**Benefits:** Resource isolation, Better organization, Easier management and monitoring.


### 📦 Deployment
The application is deployed using a Kubernetes **Deployment** resource.
**Deployment features:**
 - Runs multiple replicas of the application
 - Ensures high availability
 - Automatically replaces failed pods
 - Manages rolling updates
**Key configuration:**
 - Replicas: `2`
 - Container image: `app`
 - Application port: `5000`

### 🌐 Service
A Kubernetes **Service** of type `NodePort` is used to expose the application outside the cluster.
**Service responsibilities:**
 - Provides a stable access point for the application
 - Load balances traffic across all running pods
 - Maps internal container port to an external node port
**Port mapping:**
 - Container Port: `5000`
 - NodePort: `30007`
---

## Steps
### ▶️ Apply Kubernetes Manifests
From the root directory of the project, apply the manifests in the following order:
```bash
kubectl apply -f K8s/namespace.yaml
kubectl apply -f K8s/deployment.yaml
kubectl apply -f K8s/service.yaml
```
![create](https://github.com/EmanElshahat/DevopsTasks/blob/08bc24ef5d8e47632a757f0db9756cb4b106c466/Jenkins/lab24/screenshots/Screenshot%202026-02-08%20021114.png)


