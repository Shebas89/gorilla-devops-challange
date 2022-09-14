include "root" {
  path = find_in_parent_folders()
}

dependency "lb" {
  config_path = "../../development/lb/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/route53/"
}

inputs = {
  r53_name = "svelandia-timeoff-gorilla.com"

  record_name = "develop.svelandia-timeoff-gorilla.com"
  record_type = "A"
  ttl         = "60"
  records     = dependency.lb.outputs.dns_name.dns
}