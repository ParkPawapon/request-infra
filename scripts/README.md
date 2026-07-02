# Scripts

Scripts in this directory are safety wrappers for formatting, validation, and plan-only IaC checks.

- `fmt.sh`: runs OpenTofu or Terraform formatting.
- `validate.sh`: runs shell syntax checks, Docker Compose config validation when Docker is available, and IaC validation without credentials.
- `plan.sh`: runs plan only for `dev`, `staging`, or `prod`.

There is intentionally no apply script.

