# 🔧 Configuration Management with Ansible

## 🎯 Overview

This stage automates EC2 instance configuration using **Ansible**.  
After provisioning infrastructure with Terraform, Ansible is used to:

- Install required packages (Git, Docker, Java 17)
- Install and configure Jenkins
- Use Ansible Roles for modular configuration
- Use Dynamic Inventory to fetch EC2 public IP from Terraform output

This ensures full automation and reproducibility of the environment.

---

## 🏗 Architecture Flow

Terraform → EC2 Instance → Dynamic Inventory → Ansible Roles → Jenkins Running

---
## 🚀 How It Works

### 1️⃣ Infrastructure Provisioning
Terraform creates:
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance

The EC2 public IP is exposed via:

```hcl
output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
```
### 2️⃣ Dynamic Inventory
The script **dynamic_inventory.py** reads:
```bash
terraform output -json
```
### 3️⃣ Ansible Roles
Each role handles a specific responsibility:
- git : Install Gitd
- docker: Install and start Docker
- java: Install Java 17
- jenkins: Install and start Jenkins
This modular design improves maintainability and scalability.
---

## ▶️ Execution
Run the playbook using dynamic inventory:
```bash
ansible-playbook -i dynamic_inventory.py playbook.yml
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/41bc14a7a47849a43007548e61da09943a1cbaa5/Attachments/screenshots/playloop.png)

Test connectivity:
```bash
ansible web -i dynamic_inventory.py -m ping
```
Go to server:
```bash
ssh -i terraform-key.pem ec2-user@18.204.243.105
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/41bc14a7a47849a43007548e61da09943a1cbaa5/Attachments/screenshots/dynanamic.png)

---

## 🌐 Access Jenkins
After successful deployment:
```bash
http://<EC2_PUBLIC_IP>:8080
```
![create](https://github.com/EmanElshahat/CloudDevOpsProject/blob/41bc14a7a47849a43007548e61da09943a1cbaa5/Attachments/screenshots/jenkins-ins.png)


 ---

## ✅ Key Achievements
✔ Infrastructure fully automated
✔ Configuration fully automated
✔ Dynamic inventory integration
✔ Jenkins deployed and running
✔ Reproducible DevOps environment

---

## 🏆 Outcome
- This step completes the Configuration Management phase of the Cloud DevOps Project.
- The system is now ready for CI/CD pipeline implementation in the next stage.
