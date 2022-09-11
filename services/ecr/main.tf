provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "gl_ecr" {
  source = "./../../modules/ecr/"

  for_each = {
    for ecr_repository in var.ecr_repositories : ecr_repository.ecr_name => ecr_repository
  }
  ecr_name             = each.value.ecr_name
  image_tag_mutability = each.value.image_tag_mutability
  scan_on_push         = each.value.scan_on_push
  policy               = each.value.policy
}