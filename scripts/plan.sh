#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENVIRONMENT="${1:-}"

case "${ENVIRONMENT}" in
  dev|staging|prod) ;;
  *)
    echo "Usage: scripts/plan.sh <dev|staging|prod>" >&2
    exit 2
    ;;
esac

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

if ! TOOL="$(detect_iac_tool)"; then
  echo "OpenTofu/Terraform is required for plan." >&2
  exit 127
fi

ENV_DIR="${ROOT_DIR}/iac/environments/${ENVIRONMENT}"
PLAN_FILE="/tmp/request-infra-${ENVIRONMENT}.tfplan"

echo "Running safe plan-only workflow for ${ENVIRONMENT}; no apply will be executed."
"${TOOL}" -chdir="${ENV_DIR}" init -backend=false -input=false
"${TOOL}" -chdir="${ENV_DIR}" validate
"${TOOL}" -chdir="${ENV_DIR}" plan -input=false -lock=false -refresh=false -out="${PLAN_FILE}"
echo "Plan written outside the repository: ${PLAN_FILE}"

