# Local PostgreSQL Init Directory

This directory is mounted into the local PostgreSQL container as read-only.

Do not add legacy schema migrations here by guessing. Database schema compatibility must be handled in `request-api` migration work with explicit approval. This folder exists only for future local-only bootstrap scripts after the schema strategy is approved.

