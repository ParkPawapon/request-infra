locals {
  design = {
    project_name       = var.project_name
    environment        = var.environment
    private_by_default = var.private_by_default
    database_public    = false
    redis_public       = false
  }
}

