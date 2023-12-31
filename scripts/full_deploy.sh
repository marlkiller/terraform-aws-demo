#!/bin/bash

echo "FULL PCP BACKEND DEPLOYMENT"

source ./clean_python_files.sh

if [ ! -z $1 ]; then
    echo "Profile passed as first param"
    export AWS_PROFILE=$1
else
    if [ -z "${AWS_PROFILE}" ]; then
        echo "Which PROFILE do you want use?"
        read profile
        export AWS_PROFILE=$profile
        echo "AWS_PROFILE environment variable set to ${AWS_PROFILE}"
    else
        echo "AWS_PROFILE=${AWS_PROFILE}"
    fi
fi

if [ ! -z $2 ]; then
    echo "stage name/environment passed as second param"
    export STAGE_NAME=$2
else
    if [ -z "${STAGE_NAME}" ]; then
        echo "Which STAGE do you want to deploy to?"
        read stage
        export STAGE_NAME=$stage
        echo "STAGE_NAME environment variable set to ${STAGE_NAME}"
    else
        echo "STAGE_NAME=${STAGE_NAME}"
    fi
fi

cd ../terraform/deployment/

echo "******************************************************"
echo "**  deploy \033[1;common_account_infra\033[0;30m to  \033[0;34m$STAGE_NAME\033[0;30m**"
echo "******************************************************"

cd ./common_account_infra
terraform init -reconfigure -backend-config ../../settings/$STAGE_NAME/backend_common_account_infra.tfvars
terraform plan -lock=false -var-file ../../settings/$STAGE_NAME/variables.tfvars -out tfplan
terraform apply -lock=false tfplan
cd ..


echo "******************************************************"
echo "**  deploy \033[1;34mbackend\033[0;30m to  \033[0;34m$STAGE_NAME\033[0;30m                      **"
echo "******************************************************"

cd ./backend
terraform init -reconfigure -backend-config ../../settings/$STAGE_NAME/backend_backend.tfvars
terraform plan -lock=false -var-file ../../settings/$STAGE_NAME/variables.tfvars -out tfplan
terraform apply -lock=false tfplan
cd ..

cd ../../scripts
