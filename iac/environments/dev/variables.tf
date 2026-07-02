variable "project_name" {
  type        = string
  description = "Project name."
  default     = "request"
}

variable "environment_name" {
  type        = string
  description = "Environment name."
  default     = "dev"

  validation {
    condition     = var.environment_name == "dev"
    error_message = "This root module is only for dev."
  }
}

variable "request_web_port" {
  type        = number
  description = "request-web runtime port."
  default     = 3000
}

variable "request_api_port" {
  type        = number
  description = "request-api runtime port."
  default     = 8080
}

variable "postgres_engine_version" {
  type        = string
  description = "PostgreSQL engine version target."
  default     = "16"
}

variable "required_secret_names" {
  type        = list(string)
  description = "Secret names expected for runtime. Values are never stored in IaC."
  default = [
    "DATABASE_URL",
    "REDIS_PASSWORD",
    "SESSION_SECRET",
  ]
}

