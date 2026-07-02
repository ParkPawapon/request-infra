terraform {
  required_version = ">= 1.6.0"
}

locals {
  environment = var.environment_name
}

module "network" {
  source             = "../../modules/network"
  project_name       = var.project_name
  environment        = local.environment
  private_by_default = true
}

module "app_service" {
  source          = "../../modules/app_service"
  project_name    = var.project_name
  environment     = local.environment
  web_port        = var.request_web_port
  api_port        = var.request_api_port
  api_health_path = "/v1/health/ready"
}

module "postgres" {
  source                = "../../modules/postgres"
  project_name          = var.project_name
  environment           = local.environment
  engine_version        = var.postgres_engine_version
  public_network_access = false
}

module "redis" {
  source                = "../../modules/redis"
  project_name          = var.project_name
  environment           = local.environment
  key_prefix            = "${var.project_name}:${local.environment}"
  public_network_access = false
}

module "secrets" {
  source       = "../../modules/secrets"
  project_name = var.project_name
  environment  = local.environment
  secret_names = var.required_secret_names
}

module "observability" {
  source                  = "../../modules/observability"
  project_name            = var.project_name
  environment             = local.environment
  alert_channels_required = false
}

