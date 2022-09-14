include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/codestar_connection/"
}

inputs = {
  provider_type   = "GitHub"
  connection_name = "gl-GitHub-conecction"
}