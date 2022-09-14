include "root" {
  path = find_in_parent_folders()
}

dependency "role" {
  config_path = "../../common/iam_role/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/asg"
}

inputs = {
  max_capacity       = 2
  min_capacity       = 1
  resource_id        = "service/gl-cluster-dev/gl-service-dev"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = dependency.role.outputs.roles.ecsScaleApp.arn
}