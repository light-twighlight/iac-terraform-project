# iac-terraform-project
This repository demonstrates a production-style **Infrastructure as Code (IaC)** setup using **Terraform**.
The project provisions AWS infrastructure in a modular, multi-environment way and includes a basic **CI/CD pipeline** for Terraform validation.

```
iac-terraform-project/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── terraform/
│   ├── modules/
│   │   └── ec2/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   │
│   └── envs/
│       ├── dev/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── variables.tf
│       │   └── terraform.tfvars
│       │
│       └── prod/
│           ├── main.tf
│           ├── variables.tf
│           └── terraform.tfvars
│
└── README.md
```
---
# ⚙️ Features

- Security Group with:
    - Port 22 open for SSH
    - Port 8000 open for FastAPI
- Ubuntu EC2 instance (latest Ubuntu 22.04)
- Automatic Docker installation via user_data
- Automatic FastAPI container launch
- Outputs public IP for quick access
- Uses the same module for multiple environments
- Validates Terraform code via CI
---

# 📝 Prerequisites

- Terraform installed (terraform version)
- AWS account with Access Key + Secret Key
- Existing AWS Key Pair (ec2-key) for SSH
- Environment variables set locally:
```bash
export AWS_ACCESS_KEY_ID=<your_access_key>
export AWS_SECRET_ACCESS_KEY=<your_secret_key>
export AWS_DEFAULT_REGION=eu-central-1
```
Or
```bash
aws configure
```
---
# 🚀 Usage
- All commands are run inside an environment directory.
- Example: dev
```bash
cd terraform/envs/dev
```
1. Initialize Terraform:
```bash
terraform init
```
2. Plan the deployment:
```bash
terraform plan
```
3. Apply the deployment:
```bash
terraform apply
```
- Confirm by typing yes when prompted.
- Terraform will create Security Group, EC2, install Docker, and run FastAPI.
4. Access FastAPI in the browser:
```
http://<ec2_public_ip>:8000
```
5. SSH into the instance if needed:
```cmd
ssh -i /path/to/ec2-key.pem ubuntu@<ec2_public_ip>
```
6. To destroy all resources:
```bash
terraform destroy
```
---
# CI/CD
GitHub Actions workflow:
 - Runs on push and pull_request
- Executes:
    - `terraform fmt -check`
    - `terraform init`
    - `terraform validate`
    - `terraform plan`

No `apply` in CI.