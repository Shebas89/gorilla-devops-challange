resource "aws_codestarconnections_connection" "codestarconnection" {
  name          = var.connection_name
  provider_type = var.provider_type
}