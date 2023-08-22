# Terraform-modules-provider-aws

## Environmental
- aws cli
- terraform 1.3.7 (https://releases.hashicorp.com/terraform/)
- s3 (The s3 used to store status files needs to be created by yourself.)
## Module info
- common_account_infra
    - vpc
    - iam
- backend
    - sqs
    - sns
    - lambda
    - cloudwatch
    - eventbridge
- ec2
    - ec2

## Configure the environment
```shell
vim ~/.aws/credentials

[557071074234_UserFull]
aws_access_key_id = xxxx
aws_secret_access_key = xxxx
region=cn-north-1


export ssp_env=int-global

```

## Perform deployment

### Deploy a module

```shell
cd scripts
sh deploy.sh 557071074234_UserFull ${ssp_env} common_account_infra
sh deploy.sh 557071074234_UserFull ${ssp_env} backend
sh deploy.sh 557071074234_UserFull ${ssp_env} ec2

```
### Deploy all modules

```shell
cd scripts
sh full_deploy.sh 557071074234_UserFull ${ssp_env}
```


## Perform destroy
### Destroy a module

```shell
cd scripts
sh destroy.sh 557071074234_UserFull ${ssp_env} ec2
sh destroy.sh 557071074234_UserFull ${ssp_env} backend
sh destroy.sh 557071074234_UserFull ${ssp_env} common_account_infra
```

### Destroy all modules

```shell
cd scripts
sh full_destroy.sh 557071074234_UserFull ${ssp_env}
```