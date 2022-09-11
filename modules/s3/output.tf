output "arl" {
  description = "S3 bucket arl"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "id" {
  description = "S3 bucket id"
  value       = aws_s3_bucket.s3_bucket.id
}
