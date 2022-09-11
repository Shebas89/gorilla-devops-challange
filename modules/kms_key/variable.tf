variable "alias" {
  type = string
}

variable "description" {
  type = string
}

variable "key_usage" {
  default = "ENCRYPT_DECRYPT"
  type    = string
}

variable "customer_master_key_spec" {
  default = "SYMMETRIC_DEFAULT"
  type    = string
}

variable "is_enabled" {
  default = true
  type    = string
}