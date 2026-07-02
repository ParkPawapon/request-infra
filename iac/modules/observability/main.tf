locals {
  design = {
    project_name            = var.project_name
    environment             = var.environment
    logs_required           = true
    metrics_required        = true
    alert_channels_required = var.alert_channels_required
  }
}

