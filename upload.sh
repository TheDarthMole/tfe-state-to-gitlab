#!/bin/bash

set -ex

rm -rf "${TEMPDIR}/upload"
mkdir -p "${TEMPDIR}/upload"
cd "${TEMPDIR}/upload"

cat <<EOF > backend.tf
terraform {
  backend "http" {}
}
EOF

# Init the GitLab remote backend
${TF_BINARY} init \
  -backend-config=address="${TF_ADDRESS}" \
  -backend-config=lock_address="${TF_ADDRESS}/lock" \
  -backend-config=unlock_address="${TF_ADDRESS}/lock" \
  -backend-config=username="${TF_USERNAME}" \
  -backend-config=password="${TF_PASSWORD}" \
  -backend-config=lock_method=POST \
  -backend-config=lock_method=unlock_method=DELETE \
  -backend-config=lock_method=retry_wait_min=5

# Push the state downloaded from TFE to the GitLab remote backend
${TF_BINARY} state push "${TF_STATE_FILE}"