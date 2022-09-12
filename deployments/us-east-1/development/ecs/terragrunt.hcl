include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "./../../common/vpc/"
}

dependency "ecs_role" {
  config_path = "./../../common/iam_role/"
}

dependency "lb" {
  config_path = "../lb/"
}

dependency "sg" {
  config_path = "../security_group"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/ecs"
}

inputs = {
  cluster_name = "gl-cluster-dev"

  service_name     = "gl-service-dev"
  launch_type      = "FARGATE"
  subnets          = dependency.vpc.outputs.vpc.private_subnets
  assign_public_ip = true
  desired_count    = 1
  target_group_arn = dependency.lb.outputs.tg_arn.arn
  container_name   = "gl-container"
  security_groups = [ dependency.sg.outputs.security_groups.gl-load-balancer.id ]

  family             = "gl-dev-task-definition"
  network_mode       = "awsvpc"
  execution_role_arn = dependency.ecs_role.outputs.roles.ecsTaskExecutionRole.arn
  cpu                = 512
  memory             = 1024

  container_definitions = jsonencode([
    {
      name      = "gl-container"
      image     = "596569993860.dkr.ecr.us-east-1.amazonaws.com/gorilla-logic-images:latest-dev"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])

  role_id = dependency.ecs_role.outputs.roles.ecsTaskExecutionRole.id
  policy  = file("${get_parent_terragrunt_dir()}/../policies/ecs_policy.json")
}