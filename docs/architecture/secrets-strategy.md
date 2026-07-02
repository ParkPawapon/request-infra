# Secrets Strategy

## Secret Categories

- database credentials and DSNs
- Redis passwords or tokens
- session/auth secrets
- OAuth/OIDC client secrets
- deployment credentials
- webhook tokens

## Storage

Local examples may live in `.env.example` with non-production placeholders. Real secrets must live outside git:

- local developer `.env` files, ignored by git
- GitHub Environment secrets for CI/runtime handoff
- cloud provider secret manager after provider selection

## Rotation

- Rotate production database and Redis credentials on incident, staff change, and regular policy cadence.
- Rotate application session/auth secrets with a user impact plan.
- Keep emergency rotation runbooks provider-specific once provider is chosen.

## GitHub Actions

CI in this repository uses no production secret. Future deployment jobs must use environment-scoped secrets and least-privilege identities.

## Runtime Injection

Applications should receive secrets through platform runtime injection, not baked images, committed files, or Terraform variables containing plaintext values.

