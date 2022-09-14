module "zone" {
  source = "../../modules/route53/zone/"

  r53_name = var.r53_name
}

module "record" {
  depends_on = [ module.zone ]
  source = "../../modules/route53/record/"

  zona_id     = module.zone.id
  record_name = var.record_name
  record_type = var.record_type
  ttl         = var.ttl
  records     = var.records
}