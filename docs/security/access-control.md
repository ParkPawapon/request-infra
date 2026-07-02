# Access Control

## GitHub

- Protect `main`.
- Require PR review and CI before merge.
- Disallow force push and branch deletion.
- Allow merge commits for reviewable release history.
- Keep bypass permission limited to `ParkPawapon`.

## Infrastructure

Provider-specific access must use least privilege:

- separate identities for CI validation and deployment
- separate roles for dev, staging, and production
- no long-lived cloud access keys in git
- emergency access logged and reviewed

## Data Stores

PostgreSQL and Redis administration should be limited to approved operators and audited through provider tooling after provider selection.

