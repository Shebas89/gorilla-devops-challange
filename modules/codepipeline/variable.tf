variable "connectionarn" {
  type = string
}

variable "name" {
  type = string
}

variable "role_arn" {}

variable "location" {}

variable "sources" {
  type = list(any)
}

variable "builds" {
  type = list(any)
}

# variable "deploies" {
#   type = list(any)
# }