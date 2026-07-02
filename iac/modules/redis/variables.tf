variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "key_prefix" {
  type        = string
  description = "Redis key prefix."
}

variable "public_network_access" {
  type        = bool
  description = "Whether Redis can be reached publicly."
  default     = false

  validation {
    condition     = var.public_network_access == false
    error_message = "Redis must not be public by default."
  }
}

