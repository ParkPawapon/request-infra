SHELL := /bin/bash

COMPOSE_ENV_FILE ?= .env.example

.PHONY: help local-up local-down local-logs fmt validate plan-dev plan-staging plan-prod

help:
	@printf "request-infra commands\n"
	@printf "  make local-up       Start local PostgreSQL and Redis only\n"
	@printf "  make local-down     Stop local PostgreSQL and Redis\n"
	@printf "  make local-logs     Tail local infrastructure logs\n"
	@printf "  make fmt            Format IaC files when tofu or terraform is available\n"
	@printf "  make validate       Run safe local validation only\n"
	@printf "  make plan-dev       Run safe dev IaC plan only\n"
	@printf "  make plan-staging   Run safe staging IaC plan only\n"
	@printf "  make plan-prod      Run safe prod IaC plan only\n"

local-up:
	docker compose --env-file $(COMPOSE_ENV_FILE) -f local/docker-compose.yml up -d

local-down:
	docker compose --env-file $(COMPOSE_ENV_FILE) -f local/docker-compose.yml down

local-logs:
	docker compose --env-file $(COMPOSE_ENV_FILE) -f local/docker-compose.yml logs -f

fmt:
	bash scripts/fmt.sh

validate:
	bash scripts/validate.sh

plan-dev:
	bash scripts/plan.sh dev

plan-staging:
	bash scripts/plan.sh staging

plan-prod:
	bash scripts/plan.sh prod

