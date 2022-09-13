include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "./../../common/vpc/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/security_group/"
}

inputs = {
  security_groups = [
    {
      name   = "gl-load-balancer"
      vpc_id = dependency.vpc.outputs.vpc.id
      ingress = [
        { description = "TLS from VPC on 80 port", port = 80, protocol = "tcp", cidr = ["0.0.0.0/0"] },
        { description = "TLS from VPC on 443 port", port = 443, protocol = "tcp", cidr = ["0.0.0.0/0"] },
        { description = "TLS from VPC on 3000 port", port = 0, protocol = "all", cidr = ["10.0.0.0/20"] }
      ]
    }
  ]
}