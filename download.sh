#!/bin/bash

set -ex

rm -rf "${TEMPDIR}/download"
mkdir -p "${TEMPDIR}/download"
cd "${TEMPDIR}/download"

# Set the backend for Terraform Enterprise
cat <<EOF > backend.tf
terraform {
  cloud {
    hostname = ${TFE_ENDPOINT}
    organization = "${TFE_ORGANIZATION}"

    workspaces {
      name = "${TFE_WORKSPACE_NAME}"
    }
  }
}
EOF

${TF_BINARY} init
${TF_BINARY} state pull > "${TF_STATE_FILE}"
echo "Downloaded to ${TF_STATE_FILE}"