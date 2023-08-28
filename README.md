# Vercara Project

This project deploys a web application on AWS ECS to demonstrate scalability and automation using Terraform.

### Overview:

Platform: AWS ECS
Infrastructure as Code: Terraform
Web App: A simple application displaying "Hello, DevOps!" on the landing page.

### Deployment steps

1. Configure AWS credentials.
2. Change variables of terraform.tfvars file:
3. Change vpc_id and subnet_ids variables (number of subnets must be more that 1) in terraform.tfvars file
4. Initialize Terraform in the project directory:
```terraform init```
5. Apply the Terraform configurations:
```terraform apply```

### Features
- Implements auto-scaling based on CPU utilization.
- Uses an Application Load Balancer (ALB) for distributing traffic.
- Advanced monitoring via Amazon CloudWatch.
