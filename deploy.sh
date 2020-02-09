#!/bin/sh

DOCKER_DIR=$1

if [ -z "${DOCKER_DIR}" ]; then
    echo "No docker dir"
    exit 1
fi

if [ ! -d "${DOCKER_DIR}" ]; then 
    echo "No such dir"
    exit 1
fi

cd ${DOCKER_DIR}

GCR_ADDRESS=gcr.io/savvy-kit-260206
DOCKER_NAME=aron-backend-kernel

docker build -t ${GCR_ADDRESS}/${DOCKER_NAME}:${DOCKER_DIR} .
docker push ${GCR_ADDRESS}/${DOCKER_NAME}:${DOCKER_DIR}
