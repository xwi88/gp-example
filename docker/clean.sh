#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

image_keywords=${1}

if [[ -z "${image_keywords}" ]];then
  echo "image keywords shall not empty"
  exit 1
fi

# shellcheck disable=SC2154
if [[ "${2}" -eq "force" ]]; then
    docker images | grep "${image_keywords}" | awk '{print $3}' | xargs docker rmi -f
else
    docker images | grep "${image_keywords}" | awk '{print $3}' | xargs docker rmi
fi
