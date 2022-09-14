resource "aws_route53_record" "dev-ns" {
  zone_id = var.zona_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.ttl
  records = [var.records]
}