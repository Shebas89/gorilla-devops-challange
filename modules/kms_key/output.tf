output "alias" {
  value = aws_kms_alias.kms_key_alias.name
}

output "arn" {
  value = aws_kms_key.kms_key.arn
}

output "id" {
  value = aws_kms_key.kms_key.id
}
