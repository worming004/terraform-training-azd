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


variable "org_url" {
  description = "url of organisation"
  type        = string
  default     = "https://dev.azure.com/Worming"
}
