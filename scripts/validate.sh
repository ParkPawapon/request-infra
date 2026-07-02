#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

detect_iac_tool() {
  if [[ -n "${IAC_TOOL:-}" ]]; then
    command -v "${IAC_TOOL}" >/dev/null 2>&1 && { printf "%s\n" "${IAC_TOOL}"; return 0; }
    return 1
  fi
  if command -v tofu >/dev/null 2>&1; then
    printf "tofu\n"
    return 0
  fi
  if command -v terraform >/dev/null 2>&1; then
    printf "terraform\n"
    return 0
  fi
  return 1
}

echo "Checking shell scripts..."
for script in "${ROOT_DIR}"/scripts/*.sh; do
  bash -n "${script}"
done

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  echo "Validating Docker Compose config..."
  docker compose --env-file "${ROOT_DIR}/.env.example" -f "${ROOT_DIR}/local/docker-compose.yml" config >/dev/null
else
  echo "Docker Compose is not available; skipping compose validation."
fi

if ! TOOL="$(detect_iac_tool)"; then
  echo "OpenTofu/Terraform is not installed; skipping IaC fmt and validate."
  exit 0
fi

echo "Checking IaC formatting with ${TOOL}..."
"${TOOL}" fmt -check -recursive "${ROOT_DIR}/iac"

for env in dev staging prod; do
  echo "Validating IaC environment: ${env}"
  "${TOOL}" -chdir="${ROOT_DIR}/iac/environments/${env}" init -backend=false -input=false >/dev/null
  "${TOOL}" -chdir="${ROOT_DIR}/iac/environments/${env}" validate
done

