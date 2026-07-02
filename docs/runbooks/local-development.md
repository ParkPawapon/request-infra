# Local Development Runbook

## Start Infrastructure

```sh
make local-up
```

This starts PostgreSQL and Redis only. It does not start `request-web` or `request-api`.

## Stop Infrastructure

```sh
make local-down
```

## Service Endpoints

| Service | Local endpoint |
| --- | --- |
| PostgreSQL | `127.0.0.1:${POSTGRES_PORT:-5432}` |
| Redis | `127.0.0.1:${REDIS_PORT:-6379}` |

Use values from `.env.example` only for local development. Do not point local services at production databases.

