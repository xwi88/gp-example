#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# absolute path
# shellcheck disable=SC2034
current_path=$(cd $(dirname "$0"); pwd)

# shellcheck disable=SC1090
source "${current_path}"/version.sh

# docker registry login
docker login -u "${REGISTRY_ACCOUNT}" "${REGISTRY}" -p "${REGISTRY_PASSWORD}"

push_time=$(TZ=UTC-8 date +'%Y%m%d%H%M')
# shellcheck disable=SC2154
push_repository_tag="${repository_tag}"-"${push_time}"

docker tag "${repository_tag}" "${push_repository_tag}"
echo "docker image tag from ${repository_tag} to ${push_repository_tag}"

# docker image push
docker push "${push_repository_tag}"
echo "docker image push to ${push_repository_tag}"
