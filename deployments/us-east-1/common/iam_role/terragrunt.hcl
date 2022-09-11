include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/iam_role"
}

inputs = {
  roles = [
    {
      role_name          = "ecsTaskExecutionRole"
      assume_role_policy = file("${get_parent_terragrunt_dir()}/../policies/ecs_tasks_trust_policy.json")
    }
  ]
}
