#!/bin/sh
CONTAINER_NAME=${1?"Missing container name"}
shift

sudo nsenter -t $(docker inspect -f '{{.State.Pid}}' $CONTAINER_NAME) -n $@
