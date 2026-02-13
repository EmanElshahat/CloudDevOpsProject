# ☁️ Infrastructure Provisioning with Terraform
## 📂 Navigation
 - VPC Configuration
 - Security Group Configuration
 - EC2 Instance Configuration
 - Docker Deployment
---
## 🎯 Overview
This directory contains all Terraform configurations required to provision the infrastructure on AWS and deploy the Flask application inside a Docker container on an EC2 instance.
Terraform is used to automate infrastructure provisioning, ensure consistency, and enable Infrastructure as Code (IaC) practices.
The application is deployed on an EC2 instance and exposed to the internet through a public IP address.

---

## 🧱 AWS Components

### ☁️ VPC
A **custom Virtual Private Cloud (VPC)** is created to isolate the project resources.
**Benefits:**
 - Network isolation
 - Controlled IP addressing
 - Secure communication

### 🌐 Internet Gateway
Enables internet connectivity for the VPC, allowing resources within the public subnet to communicate with external networks and access the internet.

### 📡 Public Subnet
A public subnet configured within the **VPC** to host the EC2 instance.
Resources inside this subnet can receive public IP addresses and communicate directly with the internet through the Internet Gateway.

### 🛣️ Route Table
Controls the routing rules for the public subnet.
Configured to direct outbound traffic `0.0.0.0/0` to the Internet Gateway, enabling internet access for resources deployed in the subnet.

### 🔒 Security Group
A Security Group is configured to control inbound and outbound traffic.
**Inbound rules:**
 - SSH `22` → for remote access
 - HTTP App Port `8000` → to access the Flask application

### 🖥️ EC2 Instance
An EC2 instance is provisioned to host the application.
**Instance configuration:**
 - AMI: Amazon Linux
 - Instance type: t2.micro
 - Public IP: Enabled

---
## 🐳 Docker Deployment
After provisioning, Docker is used to run the application container.
**Deployment steps inside EC2:**
```bash
docker pull emanabosamra/app:latest
docker run -d -p 8000:5000 emanabosamra/app:latest
```
**Port mapping:**
 - Container Port: `5000`
 - EC2 Public Port: `8000`

---
## ▶️ Terraform Commands
### Initialize Terraform
    ```bash
     terraform init
    ```
### Apply Configuration
     ```bash
     terraform apply
     ```
  ![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/90461683d736d1ec4f90ae459c4299b96b9f5c9f/Attachments/screenshots/terraform-apply.png)
  
  ---

 ## 🔍 Verify Deployment
After successful deployment:
 - SSH into the EC2 instance
 - Check running containers:
 - 
```bash
docker ps
```
  ![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/7e4e8bea736f86152ce1e51ca74d9ff0d5c2cf7e/Attachments/screenshots/Verify-dep.png)
  
 ---
## 🌍 Access the Application
Open the application in your browser:
```bash
http://44.222.155.171:8000
```
  ![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/3ec2805b2849b16cdbd8c6b17287531b9149e469/Attachments/screenshots/http-terraform.png)

---

## 📦 Deliverables
 - Terraform configuration files
 - Provisioned AWS infrastructure
 - Running Docker container on EC2
 - Publicly accessible Flask application

---

## 🚀 Conclusion
By provisioning infrastructure with Terraform:
 - Infrastructure becomes reproducible
 - Deployment is automated
 - Flask app successfully exposed to the internet
This demonstrates Infrastructure as Code and containerized deployment on **AWS**.
