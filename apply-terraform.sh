#!/bin/bash
set -eu
terraform init
terraform destroy -auto-approve