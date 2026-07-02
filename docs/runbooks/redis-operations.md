# Redis Operations Runbook

Redis is required by `request-api` readiness and future cache/session behavior.

## Safety Rules

- Redis must be private in staging and production.
- Redis credentials must come from secret manager or environment secrets.
- Use environment-specific key prefixes.
- Do not cache sensitive data without a feature security review.

## Production Requirements Before Deploy

- provider-managed Redis or equivalent
- memory and eviction policy decision
- metrics and alerts
- credential rotation plan

