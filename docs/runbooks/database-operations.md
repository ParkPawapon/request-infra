# Database Operations Runbook

PostgreSQL is the system of record.

## Safety Rules

- Infra work must not change schema.
- Do not run production migrations from this repository.
- Do not seed production data from infra.
- Keep staging and production databases separate.

## Production Requirements Before Deploy

- managed backups
- restore drill
- point-in-time recovery where supported
- connection limit sizing
- audit logging if provider supports it

