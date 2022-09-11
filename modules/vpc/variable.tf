variable "azs" {
  default = []
  type    = list(any)
}

variable "cidr" {
  default = ""
  type    = string
}

variable "enable_nat_gateway" {
  default = true
  type    = bool
}

variable "enable_vpn_gateway" {
  default = true
  type    = bool
}

variable "env" {
  default = ""
  type    = string
}

variable "name" {
  default = ""
  type    = string
}

variable "public_subnets" {
  default = []
  type    = list(any)
}

variable "public_db" {
  default = false
  type    = bool
}

variable "private_subnets" {
  default = []
  type    = list(any)
}

variable "one_nat_gateway_per_az" {
  default = false
  type    = bool
}

variable "single_nat_gateway" {
  default = false
  type    = bool
}

variable "enable_dns" {
  default = true
  type    = bool
}

variable "tags" {
  type = map(string)
}
