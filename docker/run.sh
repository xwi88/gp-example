#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

# absolute path
# shellcheck disable=SC2164
current_path=$(cd $(dirname "$0"); pwd)

script_file=$(basename "$0")
echo "current script location: $current_path"
echo "current script filename: $script_file"

# shellcheck disable=SC1090
source "${current_path}"/version-latest.sh
# shellcheck disable=SC2154
echo "docker container start with tag:${repository_tag}"

cmd=$*
# shellcheck disable=SC2154
# shellcheck disable=SC2086
docker run -it --pid=host --name "${container_name}" --rm ${daemon} \
-v "${current_path}/../":/data1/services/app \
"${repository_tag}" $cmd
