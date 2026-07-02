variable "project_name" {
  type        = string
  description = "Project name used for naming conventions."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "private_by_default" {
  type        = bool
  description = "Whether network design must be private by default."
  default     = true
}

