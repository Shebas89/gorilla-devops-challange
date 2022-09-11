variable "bucket_name" {
  description = "Name used to "
  type        = string
}

variable "acl" {
  description = "acl for s3 bucket"
  default     = "private"
  type        = string
}

variable "versioning" {
  default = "Enabled"
  type    = string
}

variable "encryption" {
  default = true
  type    = bool
}

variable "bucket_sse_algorithm" {
  type = string
}

variable "public" {
  default = false
  type    = bool
}

variable "block_public_acls" {
  default = true
  type    = bool
}

variable "block_public_policy" {
  default = true
  type    = bool
}

variable "ignore_public_acls" {
  default = true
  type    = bool
}

variable "restrict_public_buckets" {
  default = true
  type    = bool
}