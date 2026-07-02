# Environment Strategy

## Local

Local uses Docker Compose for PostgreSQL and Redis. Ports are bound to `127.0.0.1` only. Local must never point at staging or production data stores.

## Dev

Dev is the first shared integration environment. It should use separate PostgreSQL, Redis, secrets, and runtime config. It can receive frequent changes from feature branches after CI validation.

## Staging

Staging mirrors production topology as closely as practical. It must use isolated data stores and secrets. Release candidates are validated here before production approval.

## Production

Production is private-by-default, isolated from all other environments, and requires explicit release approval. Production secrets must live in a cloud secret manager or GitHub Environment secrets until provider-native runtime injection is configured.

## Promotion Flow

1. Local validation.
2. Pull request CI.
3. Merge to `main`.
4. Dev deployment after provider decision.
5. Staging release candidate.
6. Production approval and deployment.

## Separation Rules

- Do not share PostgreSQL or Redis across staging and production.
- Do not commit production `.env` files.
- Do not use local tooling against production endpoints.
- Keep GitHub Environments separate for `dev`, `staging`, and `production`.
- Require protected branch and required checks before production release.

