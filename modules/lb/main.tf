resource "aws_lb" "lb" {
  name            = var.lb_name
  security_groups = [var.security_groups]
  subnets         = var.subnets
}