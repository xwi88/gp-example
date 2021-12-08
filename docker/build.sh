#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# absolute path
# shellcheck disable=SC2164
current_path=$(cd $(dirname "$0"); pwd)

# shellcheck disable=SC1090
source "${current_path}"/version.sh

# shellcheck disable=SC2154
if [[ $# -ge 1 && "${1}" -eq "vendor" ]]; then
  # shellcheck disable=SC2154
  go mod tidy && go mod vendor
  # shellcheck disable=SC2154
  docker build -t "${repository_tag}"  -f "${current_path}"/../Dockerfile.vendor .
else
  docker build -t "${repository_tag}"  -f "${current_path}"/../Dockerfile .
fi
