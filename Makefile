# Makefile to build the command lines and tests in this project.
# This Makefile doesn't consider Windows Environment. If you use it in Windows, please be careful.
SHELL := /bin/sh

existBash = $(shell cat /etc/shells|grep -w /bin/bash|grep -v grep)
ifneq (, $(strip ${existBash}))
	SHELL = /bin/bash
endif
$(info shell will use ${SHELL})

#BASEDIR = $(shell pwd)
BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))


gitBranch = $(shell git symbolic-ref --short -q HEAD)

ifeq ($(gitBranch),)
gitTag = $(shell git describe --always --tags --abbrev=0)
endif

buildTime = $(shell date "+%FT%T%z")
gitCommit = $(shell git rev-parse HEAD)
gitTreeState = $(shell if git status|grep -q 'clean';then echo clean; else echo dirty; fi)


PKG_LIST := $(shell go list ./... | grep -v /vendor/ )
GO_FILES := $(shell find . -name '*.go' | grep -v /vendor/ | grep -v _test.go)

.PHONY: default docker-build docker-up run login stop \
	test version vendor\
	main

default: main

all: run

version:
	go version

test:
	@go test -v ${PKG_LIST}

vendor:
	go mid tidy & go mod vendor

docker-build:
	bash make.sh docker:build
docker-up:
	bash make.sh docker:run

run: docker-build docker-up

stop:
	docker stop xwi88-gp-example-latest

main:
	go run main.go

login:
	docker exec -it xwi88-gp-example-latest /bin/bash
