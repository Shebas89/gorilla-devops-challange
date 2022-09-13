variable "lb_name" {
  type = string
}

variable "security_groups" {}

variable "subnets" {
  type = list(string)
}

variable "internal" {
  default = false
  type    = bool
}

variable "load_balancer_type" {
  default = "application"
  type    = string
}