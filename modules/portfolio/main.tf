terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.4.0"
    }
  }
}

resource "azuredevops_project" "base_project" {
  name            = var.project.project_name
  visibility      = "private"
  version_control = "Git"
  description     = var.project.project_description
}

resource "azuredevops_git_repository" "repositories" {
  for_each   = var.repositories
  project_id = azuredevops_project.base_project.id
  name       = each.value.repository_name
  initialization {
    init_type = "Clean"
  }
}
