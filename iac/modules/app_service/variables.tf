variable "project_name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "web_port" {
  type        = number
  description = "request-web runtime port."
}

variable "api_port" {
  type        = number
  description = "request-api runtime port."
}

variable "api_health_path" {
  type        = string
  description = "request-api readiness path."
}

