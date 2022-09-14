variable "bucket_id" {}
variable "buildspec" {
  description = "Location of buildspec"
  default     = ""
  type        = string
}
variable "build_timeout" {}
variable "cache_type" {
  default = "S3"
  type    = string
}
variable "cloudwatch_logs_group_name" {
  default = ""
  type    = string
}
variable "cloudwatch_logs_stream_name" {
  default = ""
  type    = string
}
variable "container_image" {}
variable "env_compute_type" {
  default = "BUILD_GENERAL1_SMALL"
  type    = string
}
variable "env_image_pull_credentials_type" {
  default = "CODEBUILD"
  type    = string
}
variable "env_type" {
  default = "LINUX_CONTAINER"
  type    = string
}
variable "project_description" {}
variable "project_name" {}
variable "role_arn" {}
variable "source_version" {}
variable "s3_status" {
  default = "DISABLED"
  type    = string
}
variable "type_artifacts" {
  default = "CODEPIPELINE"
  type    = string
}
variable "vcm_location" {}
variable "vcm_type" {
  default = "GitHub"
  type    = string
}
variable "env_privileged_mode" {
  default = true
  type    = bool
}