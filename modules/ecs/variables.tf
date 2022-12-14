variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "subnets" {
  type = list(any)
}

variable "launch_type" {
  default = "FARGATE"
  type    = string
}

variable "assign_public_ip" {
  default = true
  type    = bool
}

variable "desired_count" {
  default = 1
  type    = number
}

variable "family" {
  type = string
}

variable "network_mode" {
  default = "awsvpc"
  type    = string
}

variable "memory" {
  default = "1024"
  type    = string
}

variable "cpu" {
  default = "512"
  type    = string
}

variable "container_definitions" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "port" {
  default = 3000
  type    = number
}

variable "target_group_arn" {
  type = string
}

variable "container_name" {
  type = string
}
variable "security_groups" {
  type = list(any)
}