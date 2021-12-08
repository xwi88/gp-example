#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# docker image build and push params
image_namespace=${NAMESPACE}
image_name=gp-example
image_tag=latest

if [[ -z "${image_namespace}" ]]; then
    image_namespace=xwi88
fi

# shell env: REGISTRY
#repository=${REGISTRY}/${image_namespace}/${image_name}
repository=${image_namespace}/${image_name}
repository_tag=${repository}:${image_tag}

echo -e "docker repository:${repository_tag}"

# use to build container
container_name=${image_namespace}-${image_name}-${image_tag}

# ARGS ...
#daemon="-d"
#env=""
