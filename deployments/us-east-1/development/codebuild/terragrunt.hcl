include "root" {
  path = find_in_parent_folders()
}

dependency "role" {
  config_path = "../../common/iam_role/"
}

dependency "vpc" {
  config_path = "../../common/vpc/"
}

dependency "sg" {
  config_path = "../security_group/"
}

dependency "s3" {
  config_path = "../../common/s3/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/codebuild/"
}

inputs = {
  project_name        = "gl-codebuild-dev"
  project_description = "Develop codebuild project"

  vcm_type       = "CODEPIPELINE"
  vcm_location   = "https://github.com/Shebas89/timeoff-management-application.git"
  source_version = "develop"

  env_compute_type                = "BUILD_GENERAL1_SMALL"
  env_type                        = "LINUX_CONTAINER"
  container_image                 = "aws/codebuild/standard:4.0"
  env_image_pull_credentials_type = "CODEBUILD"
  env_privileged_mode             = true

  bucket_id = dependency.s3.outputs.buckets.gl-dev-artifact-logs.id

  policy      = file("${get_parent_terragrunt_dir()}/../policies/codebuild_policy.json")
  policy_name = "codebuild-policy-dev"
  role        = dependency.role.outputs.roles.codeBuildGlRole
}