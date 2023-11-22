#!/bin/bash

set -ex



export GITLAB_DEFAULT_BRANCH="main"
export GITLAB_PROJECT_ID=""
export TFE_WORKSPACE_NAME=""
export TFE_ORGANIZATION=""
export TFE_ENDPOINT=""

export TF_USERNAME="" # GitLab username
export TF_PASSWORD="" # GitLab token
export TF_ADDRESS="https://gitlab.com/api/v4/projects/${GITLAB_PROJECT_ID}/terraform/state/${GITLAB_DEFAULT_BRANCH}"
export TF_STATE_FILE="${TFE_WORKSPACE_NAME}.tfstate"
export TF_BINARY="$(which terraform)" # CHANGE ME if your pipeline uses a different version of terraform to your local
export TEMPDIR="/dev/shm"


# these will download the state file from TFE into the TF_STATE_FILE location
# and then upload from TF_STATE_FILE into GitLab
bash "$(dirname "${0}")/download.sh"
bash "$(dirname "${0}")/upload.sh"