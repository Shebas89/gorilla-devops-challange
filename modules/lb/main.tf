resource "aws_lb" "lb" {
  name               = var.lb_name
  security_groups    = [var.security_groups]
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  internal           = var.internal
}