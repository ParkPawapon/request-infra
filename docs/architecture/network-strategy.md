# Network Strategy

The network baseline is private-by-default.

## Local

Docker Compose binds PostgreSQL and Redis to `127.0.0.1` and a dedicated bridge network named `request-local`.

## Non-Local Environments

Provider-specific implementation must enforce:

- public ingress only at the web/API edge
- TLS for all public endpoints
- private PostgreSQL
- private Redis
- restricted egress where the provider supports it
- no direct public database administration endpoint
- separate network boundaries for dev, staging, and production

## Open Decisions

- cloud network service
- DNS and certificate provider
- outbound allowlist requirements
- private connectivity model for app to data stores

