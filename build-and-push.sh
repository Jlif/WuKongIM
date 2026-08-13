#!/bin/bash
set -e

IMAGE=docker.86links.com/deploy-server/third/wukong_im
TAG=${1:-$(git rev-parse --short HEAD)}

docker build -f Dockerfile -t "$IMAGE:$TAG" .
docker tag "$IMAGE:$TAG" "$IMAGE:latest"

docker push "$IMAGE:$TAG"
docker push "$IMAGE:latest"
