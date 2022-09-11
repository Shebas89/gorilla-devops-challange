output "id" {
  value = module.aws_vpc.vpc_id
}

output "arn" {
  value = module.aws_vpc.vpc_arn
}

output "public_subnets" {
  value       = module.aws_vpc.public_subnets
}

output "private_subnets" {
  value       = module.aws_vpc.private_subnets
}