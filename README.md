# TFE To GitLab State Transfer

This is a very simple script to help automate the transfer of state files from 
Terraform Enterprise to 
[GitLab managed Terraform backend](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html)

## Usage

> Edit the environment variables in `transfer.sh` to suit your environment

```bash
terraform login <YOUR_TFE_ENDPOINT>

bash transfer.sh
```