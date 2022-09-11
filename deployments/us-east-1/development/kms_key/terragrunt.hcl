include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/kms_key/"
}

inputs = {
  alias = "alias/gl-dev-kms-key"
  description = "GL Dev KMS Key"

  tags = {
    Environment = "Dev"
  }

}