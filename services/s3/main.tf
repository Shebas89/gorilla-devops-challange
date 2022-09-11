module "s3_gl" {
  source = "./../../modules/s3/"
  for_each = {
    for bucket in var.buckets : bucket.bucket_name => bucket
  }
  bucket_name          = each.value.bucket_name
  acl                  = each.value.acl
  bucket_sse_algorithm = each.value.bucket_sse_algorithm
  public               = each.value.public
}