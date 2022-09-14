module "codepipeline" {
  depends_on = [module.iam_role]
  source     = "../../modules/codepipeline/"

  name          = var.codepipeline_name
  connectionarn = var.connectionarn
  role_arn      = var.role["arn"]
  location      = var.s3_bucket["id"]
  sources       = var.vcm_source
  builds        = var.build
  # deploy      = var.deploy
}

module "iam_role" {
  source = "../../modules/iam_policy"

  policy_name = var.policy_name
  role_id     = var.role["id"]
  policy      = var.policy
}
