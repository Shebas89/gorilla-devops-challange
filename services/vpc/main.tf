module "gl_vpc" {
  source = "../../modules/vpc"

  azs             = var.azs
  cidr            = var.cidr
  name            = var.name
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  tags = merge(var.tags, {
    Environment = var.env
  })
}
