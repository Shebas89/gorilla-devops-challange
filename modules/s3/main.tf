resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    name = "${var.bucket_name}-bucket"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl
}

# resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   versioning_configuration {
#     status = var.versioning
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
#   count = var.encryption == true ? 1 : 0

#   bucket = aws_s3_bucket.s3_bucket.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = var.bucket_sse_algorithm
#     }
#   }
# }

# resource "aws_s3_bucket_public_access_block" "s3_bucket_block" {
#   count = var.public == true ? 1 : 0

#   bucket                  = aws_s3_bucket.s3_bucket.id
#   block_public_acls       = var.block_public_acls
#   block_public_policy     = var.block_public_policy
#   ignore_public_acls      = var.ignore_public_acls
#   restrict_public_buckets = var.restrict_public_buckets
# }
