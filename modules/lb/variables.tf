variable "lb_name" {
  type = string
}

variable "security_groups" {}

variable "subnets" {
  type = list(string)
}