variable "certificate_arn" {
  description = "Certificate ARN"
  type        = string
}

variable "validation_record_fqdns" {
  description = "Route 53 validation record fqdns"
  type        = list(string)
}
