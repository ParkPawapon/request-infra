# Provider Strategy

Provider configuration is intentionally not bound to a cloud account.

When a provider is selected, add a provider-specific directory or module with:

- remote state backend design
- account/project/subscription ID input
- region/location input
- provider version pinning
- least-privilege CI authentication
- staging and production separation

Do not commit cloud credentials.

