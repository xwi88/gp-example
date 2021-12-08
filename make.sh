#!/usr/bin/env bash

# with map support, bash version shall >= 4.2.0+
set -e
set -o pipefail

[[ $DEBUG == true ]] && set -x

export TZ=UTC-8

# Constant
readonly CURRENT_PATH=$(cd $(dirname "$0"); pwd)
SCRIPT_FILE=$(basename "$0")
echo "current script location: ${CURRENT_PATH}, filename:${SCRIPT_FILE}"

# input params
app_command=$1

function help_info() {
    echo "Available command options:"
    echo " docker:build                 - docker build image with tag latest"
    echo " docker:run                   - docker container run with latest image"
    echo " docker:clean                 - docker images clean, which contains none or special image tag"
    echo " help                         - displays the help"
    echo " [command]                    - Execute the specified command, eg. bash commands."
    echo -e "\033[31mAvailable params options\033[0m"
}

function show_env() {
  _str_info="registry:[${REGISTRY}], namespace:[${NAMESPACE}]"
   echo -e "\033[31m${_str_info}\033[0m"
}

case ${app_command} in
  docker:build|docker:run|docker:clean)
    case ${app_command} in
        docker:build)
          bash "${CURRENT_PATH}"/docker/build-latest.sh
          _info="exec docker:build done at:$(date "+%FT%T%z")"
          echo -e "\033[34m${_info}\033[0m"
        ;;
        docker:run)
          bash "${CURRENT_PATH}"/docker/run.sh
          _info="exec docker:run done at:$(date "+%FT%T%z")"
          echo -e "\033[34m${_info}\033[0m"
        ;;
        docker:clean)
          shift 1
          bash "${CURRENT_PATH}"/docker/clean.sh "$@"
          _info="exec docker:clean done at:$(date "+%FT%T%z")"
          echo -e "\033[34m${_info}\033[0m"
        ;;
    esac
  ;;
  help)
    help_info
    ;;
  *)
    # shellcheck disable=SC2199
    if [[ -z "$@" ]]; then
      help_info
    else
      # exec any ops, shall watch out!
      exec "$@"
    fi
    ;;
esac
