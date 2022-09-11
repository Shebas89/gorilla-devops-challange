resource "aws_kms_key" "kms_key" {
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  is_enabled               = var.is_enabled
}

resource "aws_kms_alias" "kms_key_alias" {
  name          = var.alias
  target_key_id = aws_kms_key.kms_key.key_id
}
