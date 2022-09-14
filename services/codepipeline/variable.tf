variable "connectionarn" {
  type = string
}

variable "codepipeline_name" {
  description = "name will be used for codepipeline"
  default     = "nativo-codepipeline"
  type        = string
}

variable "role" {
  type = map(any)
}

variable "policy_name" {
  type = string
}

variable "policy" {
  type = string
}

variable "vcm_source" {
  type        = list(any)
  description = "different stage of codepipeline"
}

variable "build" {
  type        = list(any)
  description = "different stage of codepipeline"
}

variable "s3_bucket" {
  type        = map(any)
  description = "bucket were codepipeline will save the logs"
}