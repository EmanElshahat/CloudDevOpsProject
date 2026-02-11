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
- **Benefits:** Resource isolation, Better organization, Easier management and monitoring.


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
![Apply](https://github.com/EmanElshahat/CloudDevOpsProject/blob/6b3856edfa280c0bf59d75aeeaf691049403b937/Attachments/screenshots/apply-k8s.png)

### 🔍 Verify Deployment Status
Check the status of all resources inside the namespace:
```bash
kubectl get all -n ivolve
```
![Verify](https://github.com/EmanElshahat/CloudDevOpsProject/blob/6b3856edfa280c0bf59d75aeeaf691049403b937/Attachments/screenshots/verify-k8s.png)

### 🌍 Access the Application
If running on Minikube, expose the service using:
```bash
minikube service app-service -n ivolve
```
![Access](https://github.com/EmanElshahat/CloudDevOpsProject/blob/6b3856edfa280c0bf59d75aeeaf691049403b937/Attachments/screenshots/access-k8s.png)

- Or access it directly via:
```bash
http://192.168.49.2:30007
```
![http](https://github.com/EmanElshahat/CloudDevOpsProject/blob/6b3856edfa280c0bf59d75aeeaf691049403b937/Attachments/screenshots/http-k8s.png)

---

## 📦 Deliverables
- Kubernetes Namespace configuration
- Deployment manifest with multiple replicas
- NodePort Service for external access
- Fully running application inside Kubernetes

---


## 🚀 Conclusion
By deploying the application on Kubernetes:
 - The application becomes highly available
 - Container orchestration is fully automated
 - The system is ready for CI/CD integration with Jenkins
 - The deployment is prepared for GitOps-based delivery using ArgoCD in later stages
