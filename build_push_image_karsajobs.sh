#!/bin/bash

GITHUB_USERNAME="rakafde"
IMAGE_NAME="karsajobs"
TAG="latest"
DOCKERFILE_PATH="./backend"
FULL_IMAGE_NAME="ghcr.io/${GITHUB_USERNAME}/${IMAGE_NAME}:${TAG}"

echo "Membuat Docker image untuk BACKEND:"

if ! docker build -t "$FULL_IMAGE_NAME" "$DOCKERFILE_PATH"; then
  echo "Gagal build image bacnend."
  exit 1
fi

echo "PUSH GHCR"
if ! docker push "$FULL_IMAGE_NAME"; then
  echo "Gagal push image backend ke GHCR."
  exit 1
fi

echo "SUKSES BUILD DAN KIRIM"
