terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.4.0"
    }
  }
}

resource "azuredevops_build_definition" "example" {
  project_id = var.project_id
  name       = "Example Build Definition"
  # path       = "\\ExampleFolder"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = var.repository_id
    yml_path    = "azure-pipelines.yml"
  }
}

