# Terraform Remote State on AWS (S3 + DynamoDB)

A hands-on project demonstrating how to configure Terraform remote state storage using AWS S3 (for state files) and DynamoDB (for state locking), then provisioning an EC2 instance running NGINX to serve a simple web page.

## What this project does

- Automates creation of an S3 bucket (with versioning) and a DynamoDB table for Terraform state locking
- Provisions a security group allowing HTTP (port 80) traffic
- Launches an EC2 instance and installs NGINX via a user-data script
- Stores Terraform's state remotely instead of locally, enabling team collaboration and preventing state conflicts

## Architecture

Terraform CLI
|
v
S3 Bucket (terraform.tfstate) <---> DynamoDB Table (state locking)
|
v
AWS EC2 Instance (NGINX web server)


## Why remote state?

Storing `terraform.tfstate` locally causes real problems in team environments:
- No single source of truth if multiple people run `terraform apply` independently
- No locking — concurrent applies can corrupt state
- Sensitive data (resource IDs, metadata) sits unprotected on a local machine

Using an S3 backend with DynamoDB locking solves this: state is centralized, versioned, encrypted, and locked during operations.

## Prerequisites

- AWS account with an IAM user having S3, DynamoDB, and EC2 permissions
- AWS CLI installed and configured (`aws configure`)
- Terraform installed (v1.x)

## Project structure


.
├── config.sh # Creates the S3 bucket + DynamoDB table (run once, before terraform init)
├── delete.sh # Tears down the S3 bucket + DynamoDB table (run after terraform destroy)
├── provider.tf # AWS provider configuration
├── backend.tf # Remote backend configuration (S3 + DynamoDB)
├── main.tf # Security group + EC2 instance resources
├── userdata.sh # Bootstrap script — installs and configures NGINX
└── .gitignore



## How to run

1. **Create the backend infrastructure:**
```bash
   chmod u+x config.sh
   ./config.sh
```

2. **Update `backend.tf`** with your own S3 bucket name and DynamoDB table name.

3. **Initialize, plan, and apply:**
```bash
   terraform init
   terraform plan
   terraform apply --auto-approve
```

4. Terraform outputs the EC2 instance's public IP — open it in a browser to see the deployed page.

## Cleanup

To avoid ongoing AWS charges:
```bash
terraform destroy --auto-approve
chmod u+x delete.sh
./delete.sh
```

## Tech used

- Terraform
- AWS (EC2, S3, DynamoDB, IAM)
- Bash
- NGINX

## Screenshot

*(add your screenshot here — e.g. `![Deployed page](screenshot.png)`)*



