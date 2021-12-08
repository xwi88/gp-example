# build image
# image include: bash, git, golang, make, openssh, tzdata
# image ENV TZ=Asia/Shanghai
FROM v8fg/ubuntu:16.04-go1.17.4-tf-cpu AS builder

#GO Module ENV
ENV LDFLAGS='-s -w' APP_PATH=/data1/services/app
ENV GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://gocenter.io/,https://proxy.golang.org,direct

WORKDIR ${APP_PATH}
