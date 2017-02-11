#!/bin/bash

GIT_SHA=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
VERSION=`cat VERSION`

docker build \
  --build-arg VCS_REF=$GIT_SHA \
  --build-arg BUILD_DATE=$BUILD_DATE \
  --build-arg VERSION=$VERSION \
  -t axeclbr/git .
