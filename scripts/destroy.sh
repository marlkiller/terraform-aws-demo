#!/usr/bin/env bash
set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ -z $1 ]]; then
    echo 'Please define the profile to use as first param'
    exit 1
fi
AWS_PROFILE=$1

if [[ -z $2 ]]; then
    echo 'Please define the terraform settings folder to use (dev/test/prod)'
    exit 1
fi
ENVIRONMENT=$2

if [[ -z $3 ]]; then
    echo 'Please define the component to deploy (dynamodb/frontend_api/user_api etc...)'
    exit 1
fi
COMPONENT=$3

DEPLOYMENT_FOLDER="$DIR/../terraform/deployment/$COMPONENT"
ENVIRONMENTS_FOLDER="$DIR/../terraform/settings"

pushd $DEPLOYMENT_FOLDER || exit

terraform destroy -auto-approve -lock=false -var-file="$ENVIRONMENTS_FOLDER/$ENVIRONMENT/variables.tfvars"
popd || exit
