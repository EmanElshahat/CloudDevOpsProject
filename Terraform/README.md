# ☁️ Infrastructure Provisioning with Terraform
## 📂 Navigation
 - [Root module calling Network and Server modules](main.tf)
 - [S3 Remote Backend configuration](backend.tf)
 - [AWS Provider configuration](provider.tf)
 - [Input variables](variables.tf)
 - [Infrastructure outputs](outputs.tf)
 - [VPC and Networking resources](modules/network/)
 - [EC2, IAM, CloudWatch configuration](modules/server/)
---
## 🎯 Overview
This directory contains Terraform **Infrastructure as Code (IaC)** scripts used to provision AWS resources required for the Cloud DevOps project.
The infrastructure is modular, scalable, and production-ready, following best practices for:
- Remote state management
- Remote state management
- IAM security
- Monitoring integration

---

## 🏗️ Provisioned Infrastructure
### 🌐 Networking (Network Module)
- VPC
- Public Subnet
- Internet Gateway
- Route Table + Association
- Security Group

### 🖥️ Compute (Server Module)
- EC2 Instance (Jenkins / Application Server)
- Key Pair configuration
- IAM Role for EC2
- IAM Role for EC2
- IAM Instance Profile

---

## 🔐 Remote State Management (S3 Backend)
Terraform uses a remote backend stored in AWS S3:
```hcl
terraform {
  backend "s3" {
    bucket = "eman-terraform-backend"
    key    = "cloud-devops/terraform.tfstate"
    region = "us-east-1"
  }
}
```
**Benefits:**
- Centralized state management
- Prevents state conflicts
- Safe collaboration
- Safe collaboration
---
## 📊 Monitoring with CloudWatch
The infrastructure integrates AWS CloudWatch to monitor EC2 performance.
Alarm triggers when:
- CPU utilization exceeds `70%`
This ensures early detection of performance bottlenecks.
Example CloudWatch Alarm:
```hcl
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
}
```
---
## 🚀 Deployment Steps
### 1️⃣ Create S3 backend bucket
```bash
aws s3api create-bucket --bucket eman-terraform-backend --region us-east-1
```
### 2️⃣ Initialize Terraform
```bash
terraform init
```
### 3️⃣ Review plan
```bash
terraform plan
```
### 4️⃣ Apply infrastructure
```bash
terraform apply
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/00f3a121a93dd9f5dc8b7b1d0f4d0e1f5fa5b4b2/Attachments/screenshots/terraform.png)
  
---

## 📦 Deliverables
- Modular Terraform configuration (Root + Network + Server modules)
- S3 Remote Backend for Terraform state
- Provisioned AWS Infrastructure:
  - VPC
  - Public Subnet
  - Route Table
  - Internet Gateway
  - Security Group
  - EC2 Instance
- Configured Key Pair for secure SSH access
- CloudWatch CPU Alarm integration
- Public EC2 instance ready for automation (Ansible & Jenkins)
---

## 🚀 Conclusion
By provisioning infrastructure with Terraform:
- Infrastructure becomes reproducible
- Environment setup is automated and consistent
- Remote state is securely managed via S3
- EC2 is prepared for configuration management and CI/CD integration
- Monitoring is integrated through CloudWatch
This demonstrates real-world **Infrastructure as Code (IaC)** practices and production-ready AWS provisioning using **Terraform Modules and Remote Backend**.
