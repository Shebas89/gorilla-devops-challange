include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/s3/"
}

inputs = {
  buckets = [
    {
      acl                  = "private"
      bucket_name          = "gl-dev-artifact-logs"
      bucket_sse_algorithm = "aws:kms"
      public               = true
    }
  ]
}