locals {
  design = {
    project_name          = var.project_name
    environment           = var.environment
    engine_version        = var.engine_version
    public_network_access = var.public_network_access
    schema_mutation       = false
    backups_required      = true
  }
}

