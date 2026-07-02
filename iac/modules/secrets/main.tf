locals {
  design = {
    project_name = var.project_name
    environment  = var.environment
    secret_names = var.secret_names
    plaintext    = false
  }
}

