output "project_id" {
  value       = azuredevops_project.base_project.id
  description = "id of the project"
}

output "repositories" {
  value = {
    for k, repo in azuredevops_git_repository.repositories : k => {
      repository_name = repo.name
      repository_id   = repo.id
    }
  }
}
