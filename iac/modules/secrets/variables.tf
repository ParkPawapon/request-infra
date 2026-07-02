variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "secret_names" {
  type        = list(string)
  description = "Names of secrets expected for the environment."
  default     = []
}

