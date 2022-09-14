resource "aws_codebuild_project" "codebuild_project" {
  name          = var.project_name
  description   = var.project_description
  build_timeout = var.build_timeout
  service_role  = var.role_arn

  artifacts {
    type = var.vcm_type
  }

  environment {
    compute_type                = var.env_compute_type
    image                       = var.container_image
    type                        = var.env_type
    privileged_mode             = var.env_privileged_mode
    image_pull_credentials_type = var.env_image_pull_credentials_type
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.cloudwatch_logs_group_name
      stream_name = var.cloudwatch_logs_stream_name
    }
  }

  source {
    git_clone_depth = 0
    type            = var.vcm_type
    buildspec       = var.buildspec
  }

  source_version = var.source_version
}