include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../common/vpc/"
}
dependency "sg" {
  config_path = "../security_group/"
}

dependency "vpc" {
  config_path = "../../common/vpc/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/lb/"
}

inputs = {
  lb_name         = "gl-loadbalancer-dev"
  security_groups = dependency.sg.outputs.security_groups.gl-load-balancer.id
  subnets         = dependency.vpc.outputs.vpc.public_subnets
  tg_name         = "gl-target-group-dev"
  vpc_id          = dependency.vpc.outputs.vpc.id
  protocol        = "HTTP"
  port            = 3000

  path              = "/login/"
  healthy_threshold = 5
}