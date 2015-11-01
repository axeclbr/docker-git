#!/bin/bash

if [ -z "$GIT_EMAIL" ] || [ -z "$GIT_NAME" ]; then

  if [ -z "$GIT_EMAIL" ]; then
    echo "Please provide environment variable \"GIT_EMAIL\"."
  fi

  if [ -z "$GIT_NAME" ]; then
    echo "Please provide environment variable \"GIT_NAME\"."
  fi

  echo "If you don't know how to do that, please consult the docs: http://bit.ly/1M4Qx3m."
  exit 1
fi

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"