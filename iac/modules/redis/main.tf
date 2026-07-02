locals {
  design = {
    project_name          = var.project_name
    environment           = var.environment
    key_prefix            = var.key_prefix
    public_network_access = var.public_network_access
    cache_behavior        = "disabled until feature-specific approval"
  }
}

