module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  single_nat_gateway     = var.single_nat_gateway

  create_database_subnet_group           = var.public_db
  create_database_subnet_route_table     = var.public_db
  create_database_internet_gateway_route = var.public_db

  enable_dns_hostnames = var.enable_dns
  enable_dns_support   = var.enable_dns

  tags = merge(var.tags, {
    ManagedBy = "Terraform"
  })
}
