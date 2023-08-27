variable "aws_region" {
  description = "The AWS region where we'll deploy our resources. By default, it uses us-west-1"
  type        = string
  default     = "us-west-1"
}

variable "docker_image_path" {
  description = "Path to the Docker image we want to use in our ECS task definition. This is a required input"
  type        = string
}


variable "subnet_ids" {
  description = "A list of subnet ids where our Application Load Balancer will be provisioned. This is crucial for the connectivity of our services"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where we'll be deploying our resources. The VPC should already exist in the specified region"
  type        = string
}
