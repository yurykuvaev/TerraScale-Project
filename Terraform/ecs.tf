resource "aws_ecs_cluster" "web_cluster" {
  name = "web-cluster"
}

resource "aws_ecs_capacity_provider" "asg_provider" {
  name = "capacity-provider-asg"
  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.asg.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      status          = "ENABLED"
      target_capacity = 85
    }
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_cps" {
  cluster_name = aws_ecs_cluster.web_cluster.name
  capacity_providers = [aws_ecs_capacity_provider.asg_provider.name]
}

resource "aws_ecs_task_definition" "web_task" {
  family                   = "web-app"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512" 
  container_definitions    = jsonencode([
    {
      name  = "web-app"
      image = var.docker_image
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "web_service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web_cluster.id
  task_definition = aws_ecs_task_definition.web_task.arn
  desired_count   = 2
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.web_tg.arn
    container_name   = "web-app"
    container_port   = 80
  }

  deployment_controller {
    type = "ECS"
  }

  health_check_grace_period_seconds = 300
}
