resource "aws_iam_role" "iam_role" {
  assume_role_policy = var.assume_role_policy
  name               = var.role_name
}