# PostgreSQL Module

Responsibility:

- managed PostgreSQL design
- private connectivity
- backup and point-in-time recovery strategy
- version and maintenance policy
- credential source from secret manager

This module must not create schema or run migrations. Database schema belongs to approved application migration work.

