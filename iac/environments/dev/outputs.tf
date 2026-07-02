output "environment_design" {
  description = "Provider-neutral dev environment design."
  value = {
    network       = module.network.design
    app_service   = module.app_service.design
    postgres      = module.postgres.design
    redis         = module.redis.design
    secrets       = module.secrets.design
    observability = module.observability.design
  }
}

