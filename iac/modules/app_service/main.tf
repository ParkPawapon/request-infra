locals {
  design = {
    project_name    = var.project_name
    environment     = var.environment
    services        = ["request-web", "request-api"]
    web_port        = var.web_port
    api_port        = var.api_port
    api_health_path = var.api_health_path
    tls_required    = true
  }
}

