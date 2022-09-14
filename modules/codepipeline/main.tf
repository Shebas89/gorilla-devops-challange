resource "aws_codepipeline" "codepipeline" {
  name     = var.name
  role_arn = var.role_arn

  artifact_store {
    location = var.location
    type     = "S3"
  }


  stage {
    name = "Source"
    dynamic "action" {
      for_each = var.sources
      content {
        name             = action.value.name
        namespace        = "SourceVariables"
        category         = action.value.name
        owner            = "AWS"
        provider         = action.value.provider
        version          = "1"
        input_artifacts  = []
        output_artifacts = [action.value.output_artifact]

        configuration = {
          ConnectionArn        = var.connectionarn
          FullRepositoryId     = action.value.repositoryid
          BranchName           = action.value.branchname
          OutputArtifactFormat = action.value.OutputArtifactFormat
        }
      }
    }
  }

  stage {
    name = "Build"
    dynamic "action" {
      for_each = var.builds
      content {
        name             = action.value.name
        namespace        = "BuildVariables"
        category         = action.value.name
        owner            = "AWS"
        provider         = action.value.provider
        input_artifacts  = [action.value.input_artifact]
        output_artifacts = [action.value.output_artifact]
        version          = "1"

        configuration = {
          ProjectName = action.value.projectname
        }
      }
    }
  }

  # stage {
  #   name = "Deploy"
  #   dynamic "action" {
  #     for_each = var.deploies
  #     content {
  #       name            = action.value.name
  #       category        = action.value.name
  #       owner           = "AWS"
  #       provider        = action.value.provider
  #       input_artifacts = [action.value.input_artifact]
  #       version         = "1"

  #       configuration = {
  #         ActionMode     = action.value.actionmode
  #         Capabilities   = action.value.capabilities
  #         OutputFileName = action.value.outputfilename
  #         StackName      = action.value.stackname
  #         TemplatePath   = action.value.templatepath
  #       }
  #     }
  #   } 
  # }
}
