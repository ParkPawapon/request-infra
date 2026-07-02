# Local Redis

Local Redis is provided by `local/docker-compose.yml` with a local-only password placeholder and `127.0.0.1` port binding.

No production Redis settings belong in this repository. Future cache behavior must use an environment-specific key prefix and must not cache sensitive data without a feature security review.

