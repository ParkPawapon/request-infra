variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "alert_channels_required" {
  type        = bool
  description = "Whether alert channels are required before production release."
  default     = true
}

