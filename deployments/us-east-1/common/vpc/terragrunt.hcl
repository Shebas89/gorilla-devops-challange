include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/vpc/"
}

inputs = {
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cidr            = "10.0.0.0/20"
  env             = "Infra"
  name            = "gl timeoff m VPC"
  private_subnets = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]
  public_subnets  = ["10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24"]
}