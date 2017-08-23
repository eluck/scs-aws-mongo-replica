#!/usr/bin/env bash
terraform init infrastructure
terraform plan -var-file=variables/vars.tfvars infrastructure
echo "Sleeping for 5 seconds"
sleep 5
terraform apply -var-file=variables/vars.tfvars infrastructure
