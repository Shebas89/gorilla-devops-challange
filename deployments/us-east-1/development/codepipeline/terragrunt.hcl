include "root" {
  path = find_in_parent_folders()
}

dependency "codestar_connection" {
  config_path = "./../../common/codestar_connection/"
}

dependency "s3" {
  config_path = "../../common/s3/"
}

dependency "role" {
  config_path = "../../common/iam_role/"
}

terraform {
  source = "${get_parent_terragrunt_dir()}/..//services/codepipeline/"
}

inputs = {
  connectionarn = dependency.codestar_connection.outputs.arn

  codepipeline_name = "gl-codepipeline-dev"
  s3_bucket         = dependency.s3.outputs.buckets.gl-dev-artifact-logs

  vcm_source = [
    { name = "Source", provider = "CodeStarSourceConnection", output_artifact = "SourceArtifact", repositoryid = "Shebas89/timeoff-management-application", branchname = "develop", OutputArtifactFormat = "CODE_ZIP"}
  ]

  build = [
    { name = "Build", provider = "CodeBuild", input_artifact = "SourceArtifact", output_artifact = "BuildArtifact", projectname = "gl-codebuild-dev"}
  ]

  policy_name = "codebuild-policy-dev"
  policy      = file("${get_parent_terragrunt_dir()}/../policies/codepipeline_policy.json")
  role        = dependency.role.outputs.roles.codepipelineGlRole
}