# Rollback Runbook

Rollback strategy depends on the provider and deployment platform.

Baseline expectations:

- application releases must keep previous image revisions available
- database schema changes require separate rollback plans
- infra changes must be reviewed with `plan` output before any future apply
- production rollback requires incident commander approval

This foundation does not include apply or rollback automation.

