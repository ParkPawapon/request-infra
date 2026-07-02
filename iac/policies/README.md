# Policy Foundation

Policy-as-code checks should enforce:

- no public PostgreSQL
- no public Redis
- TLS for public endpoints
- private-by-default networking
- least privilege IAM
- encrypted storage
- backup configuration for managed databases
- no plaintext secrets in IaC

Provider-specific policies are intentionally deferred until a provider is selected.

