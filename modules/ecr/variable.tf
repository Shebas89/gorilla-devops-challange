variable "ecr_name" {
  type = string
}

variable "image_tag_mutability" {
  default = "IMMUTABLE"
  type    = string
}

variable "scan_on_push" {
  default = false
  type    = bool
}

variable "policy" {
  type = string
}
