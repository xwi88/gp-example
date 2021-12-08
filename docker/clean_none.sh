#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# shellcheck disable=SC2154
if [[ "${1}" -eq "force" ]]; then
    docker images | grep none | awk '{print $3}' | xargs docker rmi -f
else
    docker images | grep none | awk '{print $3}' | xargs docker rmi
fi
