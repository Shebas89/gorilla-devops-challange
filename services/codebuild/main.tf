module "codebuild" {
  source = "../../modules/codebuild/"

  project_name        = var.project_name
  project_description = var.project_description
  type_artifacts      = var.type_artifacts
  build_timeout       = var.build_timeout
  role_arn            = var.role["arn"]

  vcm_type       = var.vcm_type
  vcm_location   = var.vcm_location
  source_version = var.source_version

  env_compute_type                = var.env_compute_type
  container_image                 = var.container_image
  env_type                        = var.env_type
  env_image_pull_credentials_type = var.env_image_pull_credentials_type
  env_privileged_mode             = var.env_privileged_mode

  bucket_id = var.bucket_id
}

module "iam_role" {
  source = "../../modules/iam_policy"

  policy_name = var.policy_name
  role_id     = var.role["id"]
  policy      = var.policy
}