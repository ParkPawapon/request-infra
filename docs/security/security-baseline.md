# Security Baseline

| Area | Baseline |
| --- | --- |
| Network | Private-by-default; no public PostgreSQL or Redis. |
| TLS | Required for public web/API endpoints outside local. |
| IAM | Least privilege per environment and workload. |
| Secrets | Secret manager or GitHub Environment secrets; no secret in git. |
| CI | `contents: read` by default; no deploy from validation workflow. |
| Audit | Enable provider audit logs after provider selection. |
| Backups | PostgreSQL backups and restore drills required before production. |
| DR | Define RPO/RTO before production release. |
| Dependency scanning | Add Dependabot or provider-equivalent scanning after repo policy decision. |
| IaC scanning | Add tflint/checkov/tfsec or equivalent after provider modules exist. |
| Branch protection | Require PR, required checks, no force push, no deletion, merge commits allowed. |
| Bypass | Bypass, if configured, must be limited to `ParkPawapon`. |

This foundation does not deploy or create resources.

