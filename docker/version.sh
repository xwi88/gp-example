#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# docker image build and push params
image_namespace=${NAMESPACE}
image_name=gp-example
image_tag=

if [[ -z "${image_namespace}" ]]; then
    image_namespace=xwi88
fi

git_commit_hash_short=$(git rev-parse --short HEAD)
if [[ -n "${git_commit_hash_short}" ]]; then
  image_tag=${git_commit_hash_short}
fi

# shell env: REGISTRY
repository=${REGISTRY}/${image_namespace}/${image_name}
repository_tag=${repository}:${image_tag}

git_branch=$(git symbolic-ref --short -q HEAD)
_str_info="git branch:[${git_branch}], commit hash short:[${git_commit_hash_short}], tag:[${image_tag}]"
echo -e "\033[32m${_str_info}\033[0m"
echo -e "docker repository:${repository_tag}"
