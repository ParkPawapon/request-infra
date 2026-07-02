# IaC Foundation

This directory contains provider-neutral OpenTofu/Terraform-compatible infrastructure design.

Current state:

- no cloud provider is selected
- no backend state is configured
- no real cloud resources are declared
- no production credentials are stored here

Environment directories validate and plan safely because modules expose design outputs only. Provider-specific resources should be added after cloud provider, region, network, domain, and secret manager decisions are approved.

