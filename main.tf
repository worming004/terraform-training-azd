terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.4.0"
    }
  }
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/Worming"
}

resource "azuredevops_project" "my_project" {
  name = "MyProject"
  visibility = "private"
  version_control = "Git"
  description = "Very Description"
}


resource "azuredevops_git_repository" "initial_repo" {
  project_id = azuredevops_project.my_project.id
  name       = "second_repo"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_"
