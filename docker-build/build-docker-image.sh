#!/bin/bash

IMAGE_TAG=smartmontools-build

docker build --no-cache -f Dockerfile -t ${IMAGE_TAG} .