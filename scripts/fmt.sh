#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHECK_MODE="${1:-}"

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
  echo "OpenTofu/Terraform is not installed; skipping IaC formatting."
  exit 0
fi

if [[ "${CHECK_MODE}" == "--check" ]]; then
  "${TOOL}" fmt -check -recursive "${ROOT_DIR}/iac"
else
  "${TOOL}" fmt -recursive "${ROOT_DIR}/iac"
fi

