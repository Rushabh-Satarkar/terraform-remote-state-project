# Terraform Remote State on AWS (S3 + DynamoDB)

A hands-on project demonstrating how to configure Terraform remote state storage using AWS S3 (for state files) and DynamoDB (for state locking), then provisioning an EC2 instance running NGINX to serve a simple web page.

## What this project does

- Automates creation of an S3 bucket (with versioning) and a DynamoDB table for Terraform state locking
- Provisions a security group allowing HTTP (port 80) traffic
- Launches an EC2 instance and installs NGINX via a user-data script
- Stores Terraform's state remotely instead of locally, enabling team collaboration and preventing state conflicts

## Architecture
