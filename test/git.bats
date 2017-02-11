#!/usr/bin/env bats

@test "missing env var GIT_NAME should lead to correct error message" {
  unset GIT_NAME
  export GIT_EMAIL="the.one@red-pill.org"
  run ./git
  [ $status -eq 1 ]
  [ "$output" = "Please provide environment variable \"GIT_NAME\" and \"GIT_EMAIL\"." ]
}

@test "missing env var GIT_EMAIL should lead to correct error message" {
  export GIT_NAME="Thomas A. Anderson"
  unset GIT_EMAIL
  run ./git
  [ $status -eq 1 ]
  [ "$output" = "Please provide environment variable \"GIT_NAME\" and \"GIT_EMAIL\"." ]
}

@test "git should be executed, if mandatory env vars are set" {
  export GIT_NAME="Thomas A. Anderson"
  export GIT_EMAIL="cool.name@cool-provider.com"
  run ./git --version
  [ $status -eq 0 ]
  [[ "$output" =~ "git version 2.11.1" ]]
}

