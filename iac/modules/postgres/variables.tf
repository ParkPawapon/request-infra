variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "engine_version" {
  type        = string
  description = "PostgreSQL major version target."
}

variable "public_network_access" {
  type        = bool
  description = "Whether PostgreSQL can be reached publicly."
  default     = false

  validation {
    condition     = var.public_network_access == false
    error_message = "PostgreSQL must not be public by default."
  }
}

