resource "aws_lb_target_group" "lb_tg" {
  name        = var.tg_name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id

  health_check {
    protocol          = var.protocol
    path              = var.path
    healthy_threshold = var.healthy_threshold
  }
}