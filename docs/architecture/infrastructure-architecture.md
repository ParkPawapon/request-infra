# Infrastructure Architecture

`request-infra` is the platform foundation for the split Request system:

- `request-web`: Next.js frontend, port 3000 locally, calls the backend through `NEXT_PUBLIC_API_BASE_URL`
- `request-api`: Go/Gin backend, port 8080 locally, health endpoint at `/v1/health/ready`
- PostgreSQL: source-of-truth relational database
- Redis: backend readiness dependency and future cache/session infrastructure

This repository is intentionally provider-neutral. It does not deploy real infrastructure, configure a cloud account, or mutate database schema.

## Runtime Requirements

| Component | Requirement |
| --- | --- |
| Web | Node/Bun-compatible Next.js runtime, public API base URL, TLS in non-local environments. |
| API | Go service runtime, `/v1` routing, PostgreSQL DSN, Redis address/password/DB, CORS allowlist, request timeout config. |
| PostgreSQL | Private connectivity, backups, point-in-time recovery where supported, no schema mutation from infra. |
| Redis | Private connectivity, password/token auth, environment-specific key prefix. |
| Observability | Application logs, access logs, error logs, DB/Redis metrics, health checks, alerting. |

## Foundation Structure

- `local/`: Docker Compose for local PostgreSQL and Redis only.
- `iac/modules/`: provider-neutral design modules.
- `iac/environments/`: dev, staging, and prod root modules.
- `docs/`: architecture, runbooks, security, and standards.
- `scripts/`: safe fmt, validate, and plan-only wrappers.
- `.github/workflows/`: validation CI.

## Dependency Direction

Infrastructure consumes runtime requirements from `request-web` and `request-api`; it does not modify application repositories. Database schema remains owned by explicit application migration work, not this infra foundation.

## Unknown Decisions

- cloud provider
- region/location
- domain and DNS provider
- container/image registry
- state backend
- production sizing
- backup retention targets
- alert channels

