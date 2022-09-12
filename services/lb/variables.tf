variable "lb_name" {
  type = string
}

variable "security_groups" {}

variable "subnets" {
  type = list(string)
}

variable "protocol" {
  default = "HTTP"
  type    = string
}

variable "type" {
  default = "forward"
  type    = string
}

variable "tg_name" {
  type = string
}

variable "port" {
  default = 80
  type    = number
}

variable "target_type" {
  default = "ip"
  type    = string
}

variable "vpc_id" {
  type = string
}

variable "path" {
  type = string
}

variable "healthy_threshold" {
  type = number
}