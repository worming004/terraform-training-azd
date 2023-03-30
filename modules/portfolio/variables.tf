variable "project" {
  description = "project object"
  type = object({
    project_name        = string
    project_description = string
  })
}

variable "repositories" {
  description = "repositories to push"
  type = map(object({
    repository_name = string
  }))
}

