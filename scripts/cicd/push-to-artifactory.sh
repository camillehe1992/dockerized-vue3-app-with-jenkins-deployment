#!/bin/sh

APP_NAME=${REPOSITORY}
REPOSITORY=${REPOSITORY}
IMAGE_TAG=$(cat image-tag.txt)

echo $IMAGE_TAG

# Retrieve an authentication token and authenticate your Docker client to your registry
aws ecr get-login-password --region cn-north-1 | docker login --username AWS --password-stdin $REPOSITORY

# Tag your image so you can push the image to this repository
docker tag $APP_NAME:$IMAGE_TAG $REPOSITORY/$APP_NAME:$IMAGE_TAG
docker tag $APP_NAME:$IMAGE_TAG $REPOSITORY/$APP_NAME:latest

# Push image
docker image push --all-tags registry-host:5000/myname/sample-vue-app-with-cicd

docker push $REPOSITORY/$APP_NAME:latest

exit
