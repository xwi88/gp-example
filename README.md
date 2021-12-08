# gp-example

gp example with docker

## Env

- `go 1.16+`
- `docker & docker engine, maybe need docker-compose`
- docker image shall use: `v8fg/ubuntu:16.04-go1.17.4-tf-cpu'
    - more images ref: [v8fg/docker-compose-resources](https://github.com/v8fg/docker-compose-resources.git)

## Command

```bash
# docker image build
make docker-build

# docker container run
make docker-up

# run docker with build image
make run

# print tf and others version
make or make main

# login the docker container
make login

# stop the docker container, only can be run out of the container
make stop
```
