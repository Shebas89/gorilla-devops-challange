variable "tg_name" {
  type = string
}

variable "protocol" {
  default = "HTTP"
  type    = string
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