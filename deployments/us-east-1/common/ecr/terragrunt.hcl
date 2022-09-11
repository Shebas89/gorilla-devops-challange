include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/ecr/"
}

inputs = {
  ecr_repositories = [
    {
      ecr_name             = "gorilla-logic-images"
      image_tag_mutability = false
      policy               = file("${get_parent_terragrunt_dir()}/../policies/ecr_repository_policy.json")
      scan_on_push         = true
    }
  ]

}