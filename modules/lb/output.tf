output "arn" {
  value = aws_lb.lb.arn
}

output "dns" {
  value = aws_lb.lb.dns_name
}