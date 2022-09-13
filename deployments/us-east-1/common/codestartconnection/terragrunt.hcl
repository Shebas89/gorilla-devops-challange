include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//modules/codestartconnections/"
}

inputs = {
  provider_type   = "GitHub"
  connection_name = "gl-GitHub-conecction"
}