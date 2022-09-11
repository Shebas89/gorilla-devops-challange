variable "azs" {
  default = []
  type    = list(any)
}

variable "cidr" {
  default = ""
  type    = string
}

variable "env" {
  type = string
}

variable "name" {
  default = ""
  type    = string
}

variable "public_subnets" {
  default = []
  type    = list(any)
}

variable "private_subnets" {
  default = []
  type    = list(any)
}

variable "tags" {
  default = {}
  type    = map(string)
}
