module "lb" {
  source = "../../modules/lb"

  lb_name         = var.lb_name
  security_groups = var.security_groups
  subnets         = var.subnets
}

module "lb_listener" {
  depends_on = [ module.lb, module.lb_tg ]
  source = "../../modules/lb_listener"

  load_balancer_arn = module.lb.arn
  target_group_arn  = module.lb_tg.arn
}

module "lb_tg" {
  source = "../../modules/lb_tg"

  tg_name  = var.tg_name
  vpc_id   = var.vpc_id
  protocol = var.protocol
  port     = var.port

  path              = var.path
  healthy_threshold = var.healthy_threshold
}