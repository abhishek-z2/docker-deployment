#!/bin/sh
#
if [ "$#" -ne 2 ]; then
 echo "Usage: ./builder.sh <github-repo> <docker-image>"
 exit 1
fi

GITHUB_REPO=$1
DOCKER_IMAGE=$2

WORK_DIR=$(mktemp -d)

git clone "https://github.com/${GITHUB_REPO}.git" "$WORK_DIR/repo"

docker build -t "$DOCKER_IMAGE" "$WORK_DIR/repo"

docker push "$DOCKER_IMAGE"

rm -rf "$WORK_DIR"
