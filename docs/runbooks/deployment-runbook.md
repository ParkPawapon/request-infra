# Deployment Runbook

Deployment is not implemented in this foundation.

Before deployment automation is added:

1. Select cloud provider, region, DNS, and image registry.
2. Configure remote state backend.
3. Configure secret manager and runtime injection.
4. Define environment approvals in GitHub Environments.
5. Run plan in dev, staging, then production.
6. Verify `/v1/health/ready` for `request-api`.
7. Verify `request-web` can reach the configured API base URL.

Do not run apply from this repository until provider-specific deployment workflow is approved.

