source .env

FULL_IMAGE_NAME="ghcr.io/${GITHUB_USERNAME}/${IMAGE_NAME_BE}:${TAG}"

echo "$GHCR_TOKEN" | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin

docker build -t "$FULL_IMAGE_NAME" "$DOCKERFILE_PATH_BE" || exit 1
docker push "$FULL_IMAGE_NAME" || exit 1

echo "Backend image pushed: $FULL_IMAGE_NAME"
