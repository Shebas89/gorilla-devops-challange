resource "aws_iam_role_policy" "iam_role_policy" {
  name = var.policy_name
  role = var.role_id

  policy = var.policy
}