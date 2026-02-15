# 🚀 ArgoCD Continuous Deployment (GitOps)
## 📂 Navigation
- [ArgoCD Application definition](application.yaml)
- [Kubernetes Deployment & Service manifests](../K8s)
- [CI pipeline that updates image tags](../Jenkins)

---
## 🎯 Directory Purpose
This directory contains the ArgoCD configuration responsible for enabling **Continuous Deployment (CD)** using a GitOps workflow.
ArgoCD continuously monitors the GitHub repository and automatically synchronizes the Kubernetes manifests into the cluster whenever changes occur.
ArgoCD continuously monitors the GitHub repository and automatically synchronizes the Kubernetes manifests into the cluster whenever changes occur.

---

## 🛠️ Deployment Architecture
**CI/CD Flow**
1. Developer pushes code to GitHub
2. Jenkins pipeline:
   - Builds Docker image
   - Scans image using Trivy
   - Pushes image to DockerHub
   - Updates Kubernetes manifests
   - Pushes updated manifests to GitHub
3. ArgoCD:
   - Detects changes in GitHub repository
   - Automatically syncs manifests
   - Deploys the updated application into the cluster

---

## ⚙️ Implementation Steps
### 1️⃣ Install K3s Cluster
```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_SELINUX_RPM=true sh -
```
Verify cluster:
```bash
sudo /usr/local/bin/kubectl get nodes
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/0b6011fd347e81b12534e1048713c12c21f6b8eb/Attachments/screenshots/cluster-nodes.png)

### 2️⃣ Install ArgoCD 
```bash
sudo /usr/local/bin/kubectl create namespace argocd
sudo /usr/local/bin/kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verify pods:

```bash
sudo /usr/local/bin/kubectl get pods -n argocd
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/0b6011fd347e81b12534e1048713c12c21f6b8eb/Attachments/screenshots/argocd-pods.png)

### 3️⃣ Expose ArgoCD Server
```bash
sudo /usr/local/bin/kubectl patch svc argocd-server -n argocd \
  -p '{"spec": {"type": "NodePort"}}'
```

Retrieve NodePort:
```bash
sudo /usr/local/bin/kubectl get svc argocd-server -n argocd
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/0b6011fd347e81b12534e1048713c12c21f6b8eb/Attachments/screenshots/argocd-server.png)

Access ArgoCD:
```bash
https://52.90.27.54:31396
```

### 4️⃣ Retrieve Initial Admin Password
```bash
sudo /usr/local/bin/kubectl -n argocd get secret argocd-initial-admin-secret \
-o jsonpath="{.data.password}" | base64 -d
```
**Login:**
- Username: `admin`
- Password: Retrieved value `N3HvKBikdjnOVDZM`

---

## 🧠 Create ArgoCD Application
`application.yaml`
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: flask-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/EmanElshahat/CloudDevOpsProject.git
    targetRevision: main
    path: K8s
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

**Apply**
```bash
sudo /usr/local/bin/kubectl apply -f ArgoCD/application.yaml
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/0b6011fd347e81b12534e1048713c12c21f6b8eb/Attachments/screenshots/apply-argocd-app.png)

---

## 🔄 Auto Sync Configuration
The application is configured with:
- automated: `sync`
- prune: `true`
- selfHeal: `true`
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/0b6011fd347e81b12534e1048713c12c21f6b8eb/Attachments/screenshots/apply-argocd-app.png)


---

## ✅ Final Result
- Jenkins builds and pushes Docker image
- Jenkins updates Kubernetes manifests
- ArgoCD automatically deploys changes
- Application stays synchronized with Git repository

---

## 🏁 Outcome
Fully automated CI/CD pipeline:
```scss
GitHub → Jenkins → DockerHub → GitHub (manifests) → ArgoCD → Kubernetes
```
This completes the **DevOps** lifecycle from code to production deployment.
