# request-infra

Provider-neutral infrastructure foundation for the Request platform.

This repository prepares local development infrastructure, environment strategy, IaC structure, security standards, CI validation, and runbooks for:

- `request-web`: Next.js frontend
- `request-api`: Go/Gin API under `/v1`
- PostgreSQL
- Redis

No production deployment is performed from this foundation. No cloud account, region, domain, state backend, or production sizing has been selected yet.

## Safety Rules

- Do not commit `.env`, real credentials, private keys, state files, or real `*.tfvars`.
- Do not run `terraform apply`, `tofu apply`, `kubectl apply`, or any deploy command from this foundation.
- Do not change database schema from infrastructure work.
- Keep PostgreSQL and Redis private by default in every non-local environment.
- Keep local ports bound to `127.0.0.1`.

## Tooling Choice

OpenTofu is the default IaC CLI in scripts and CI because it is open-source and Terraform-compatible for this provider-neutral foundation. The scripts fall back to Terraform when `tofu` is unavailable locally.

## Quick Commands

```sh
make help
make validate
make local-up
make local-down
make plan-dev
```

`plan-*` commands run plan only. There is intentionally no apply target.

