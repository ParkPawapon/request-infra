# Threat Model

## Assets

- production PostgreSQL data
- Redis data and credentials
- application runtime secrets
- deployment credentials
- GitHub repository and CI workflow permissions

## Primary Threats

| Threat | Control |
| --- | --- |
| Secret committed to git | `.gitignore`, CI review, GitHub secret scanning expectation. |
| Public database exposure | private-by-default module contracts and network policy. |
| Public Redis exposure | private-by-default module contracts and network policy. |
| CI credential misuse | validation workflow uses no production secret and read-only repository permission. |
| Accidental apply/deploy | no apply scripts, no apply Make target, plan-only scripts. |
| Schema drift from infra | infra docs forbid DB schema mutation. |
| Environment data leakage | isolated DB/Redis/secrets per environment. |

## Out of Scope Until Provider Selection

- provider IAM role definitions
- network security group rules
- WAF/CDN rules
- managed backup resource configuration
- centralized log retention policy

