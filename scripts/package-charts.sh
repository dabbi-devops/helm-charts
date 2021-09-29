#!/usr/bin/env bash
set -euo pipefail

GIT_REPO_ROOT=$(git rev-parse --show-toplevel)
STABLE="${GIT_REPO_ROOT}/stable"

PACKAGE_DIR="${GIT_REPO_ROOT}/build"
mkdir -p "${PACKAGE_DIR}"

helm package "${STABLE}/"* --destination "${PACKAGE_DIR}/stable"
