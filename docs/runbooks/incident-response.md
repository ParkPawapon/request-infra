# Incident Response Runbook

## Initial Triage

1. Identify affected environment.
2. Check application health endpoints.
3. Check PostgreSQL and Redis availability.
4. Review recent deployments and infrastructure changes.
5. Confirm no secrets were exposed in logs.

## Escalation

Production incidents need an incident owner, communications owner, and technical lead. Provider-specific paging and alert routing are deferred until provider selection.

## Security Incident

For suspected secret leakage, rotate affected secrets, revoke exposed credentials, and audit GitHub and provider logs.

