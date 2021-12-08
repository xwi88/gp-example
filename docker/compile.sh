#!/usr/bin/env bash

set -e
[[ $DEBUG == true ]] && set -x

if [[ -z "$1" ]];then
    _str_info="input app_env shall not empty"
    echo -e "\033[31m${_str_info}\033[0m"
    exit 1
fi

current_path=$(cd $(dirname "$0"); pwd)

app_env=$1

root_dir="${current_path}/.."
conf_dir="${root_dir}/profiles/${app_env}"
if [[ ! -d "${conf_dir}" ]]; then
	_str_info="conf_dir(${conf_dir}) not exist"
  echo -e "\033[31m${_str_info}\033[0m"
  exit 1
fi

rm -rf "${root_dir}"/dist/*
mkdir -p "${root_dir}"/dist/{conf,log}

# 配置文件资源copy至dist
if [[ "$(ls -A "${conf_dir}")" = "" ]]; then
  _str_info="no files in conf_dir(${conf_dir})"
  echo -e "\033[31m${_str_info}\033[0m"
  exit 1
else
  cp -r "${root_dir}"/profiles/"${app_env}"/* "${root_dir}"/dist/conf
  cp "${root_dir}"/entrypoint.sh "${root_dir}"/dist
  chmod +x "${root_dir}"/entrypoint.sh
fi
