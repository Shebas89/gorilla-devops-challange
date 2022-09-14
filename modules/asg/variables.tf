variable "max_capacity" {
  default = 2
  type = number
}

variable "min_capacity" {
  default = 1
  type = number
}

variable "resource_id" {
  type = string
}

variable "scalable_dimension" {
  default = "ecs:service:DesiredCount"
  type = string
}

variable "role_arn" {
  type = string
}

variable "appas_policy_name_cpu" {
  default = "application-scaling-policy-cpu"
  type    = string
}

variable "appas_policy_name_mem" {
  default = "application-scaling-policy-memory"
  type    = string
}

variable "policy_type" {
  default = "TargetTrackingScaling"
  type    = string
}