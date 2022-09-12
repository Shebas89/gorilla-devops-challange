resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each = var.ingress
    content {
      cidr_blocks = ingress.value.cidr
      from_port   = ingress.value.port
      protocol    = "tcp"
      to_port     = ingress.value.port
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = var.name
    terraform = "true"
  }
}