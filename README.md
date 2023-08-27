Vercara Project

This project deploys a web application on AWS ECS to demonstrate scalability and automation using Terraform.

Overview:

Platform: AWS ECS
Infrastructure as Code: Terraform
Web App: A simple application displaying "Hello, DevOps!" on the landing page.
Deployment Steps:

Configure AWS credentials.
Initialize Terraform in the project directory:
terraform init
Apply the Terraform configurations:
terraform apply

Features:
Implements auto-scaling based on CPU utilization.
Uses an Application Load Balancer (ALB) for distributing traffic.
Advanced monitoring via Amazon CloudWatch.