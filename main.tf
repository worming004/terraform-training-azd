terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.4.0"
    }
  }
}

locals {
  repositories = {
    initial_repo = {
      repository_name = "initial_repo"
    }
  }

  project = {
    project_name        = "MySuperProject"
    project_description = "Very Description"
  }
}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/Worming"
}

module "single_portfolio" {
  source = "./modules/portfolio"

  project = local.project

  repositories = local.repositories
}

module "pipelines" {
  for_each = module.single_portfolio.repositories
  source   = "./modules/ci"

  project_id = module.single_portfolio.project_id

  repository_id = each.value.repository_id
}
