# CI Validation

GitHub Actions validates the infrastructure foundation with:

- shell script syntax checks
- Docker Compose config rendering
- OpenTofu formatting checks
- OpenTofu initialization with `-backend=false`
- OpenTofu validation for `dev`, `staging`, and `prod`

CI does not use production secrets, deploy, or apply infrastructure.

