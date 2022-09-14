module "ecs" {
  source = "../../modules/ecs"

  cluster_name = var.cluster_name

  service_name     = var.service_name
  launch_type      = var.launch_type
  subnets          = var.subnets
  assign_public_ip = var.assign_public_ip
  desired_count    = var.desired_count
  port             = var.port
  target_group_arn = var.target_group_arn
  container_name   = var.container_name
  security_groups  = var.security_groups

  family             = var.family
  network_mode       = var.network_mode
  memory             = var.memory
  cpu                = var.cpu
  execution_role_arn = var.execution_role_arn

  task_role_arn         = var.execution_role_arn
  container_definitions = var.container_definitions
}

module "iam_policy" {
  source = "../../modules/iam_policy"

  policy_name = "ecs_iam_policy"
  role_id     = var.role_id
  policy      = var.policy
}

module "asg" {
  source = "../../modules/asg"

  max_capacity       = 2
  min_capacity       = 1
  resource_id        = "service/${var.cluster_name}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = var.role_arn_asg
}