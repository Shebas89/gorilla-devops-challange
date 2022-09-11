module "security_group" {
  source = "../../modules/security_group/"

  for_each = {
    for security_group in var.security_groups: security_group.name => security_group  
  }

  name        = each.value.name
  description = "Allow TLS inbound traffic for ${each.value.name}"
  vpc_id      = each.value.vpc_id

  ingress = each.value.ingress
}