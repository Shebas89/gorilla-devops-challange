variable "load_balancer_arn" {
  type = string
}

variable "port" {
  default = "80"
  type    = string
}

variable "protocol" {
  default = "HTTP"
  type    = string
}

variable "target_group_arn" {
  type = string
}

variable "type" {
  default = "forward"
  type    = string
}