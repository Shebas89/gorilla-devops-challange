include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/iam_service_linked_role/"
}

inputs = {
  aws_service_name = "ecs.amazonaws.com"
}