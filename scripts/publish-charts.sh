#!/usr/bin/env bash
set -euo pipefail

GIT_REPO_ROOT=$(git rev-parse --show-toplevel)
STABLE="${GIT_REPO_ROOT}/stable"
PACKAGE_DIR="${GIT_REPO_ROOT}/build"

REPOSITORY="https://github.com/dabbi-devops/helm-charts.git"
git remote set-url origin ${REPOSITORY}
git checkout github-pages
mv -f $PACKAGE_DIR/stable/*.tgz .
helm repo index . --url https://dabbi-devops.github.io/helm-charts/
git add .

git commit -m "Publish stable charts"
git push origin github-pages
echo "✅ Published charts"
