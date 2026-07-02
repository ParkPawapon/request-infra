# Infrastructure Coding Standards

- Prefer provider-neutral modules until the provider is selected.
- Keep environment roots small and explicit.
- Commit only examples, never real `.env`, `*.tfvars`, state, plans, or credentials.
- Use `make validate` before opening a pull request.
- Use `plan` before any future apply workflow.
- Keep production private-by-default.
- Do not expose PostgreSQL or Redis publicly.
- Do not mutate database schema from infra.
- Keep CI permissions minimal.
- Add provider-specific policies once real resources exist.

