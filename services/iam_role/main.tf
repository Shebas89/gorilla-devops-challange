module "role" {
  source = "../../modules/iam_role/"
  for_each = {
    for role in var.roles : role.role_name => role
  }
  role_name          = each.value.role_name
  assume_role_policy = each.value.assume_role_policy
}