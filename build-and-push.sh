#!/bin/bash
set -e

IMAGE=docker.86links.com/deploy-server/third/wukong_im
TAG=${1:-$(git rev-parse --short HEAD)}
PLATFORMS=linux/amd64,linux/arm64

# 首次使用需创建一次 builder: docker buildx create --name multiarch --use
docker buildx build -f Dockerfile \
  --platform "$PLATFORMS" \
  -t "$IMAGE:$TAG" -t "$IMAGE:latest" \
  --push .
