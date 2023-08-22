##############################################
# GENERAL INFORMATION
##############################################

aws_profile = "557071074234_UserFull"
aws_region  = "us-east-2"
partition  = "aws"

lambda_subnet_ids         = ["subnet-0c6a0af8d529d5928", "subnet-0201584cca342e743"]
lambda_security_group_ids = ["sg-0e7c7f34bdeb955ae"]

instance_name = "traffic_instance"
instance_type = "t3.micro"
ec2_subnet_id         = "subnet-0c6a0af8d529d5928"
ami         = "ami-0ccabb5f82d4c9af5"
iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"

tags = {
  environment = "int-global"
  project     = "Network Monitor - China"
  creators    = "SSP-Cloud"
  emails      = "ncx-aws@list.bmw.com"
}

datadog_monitored = true
#domain_name       = "int.manage.aws.bmw.cloud"
prefix            = "int-global"

##############################################
# COMMON ACCOUNT INFRA DEPLOYMENT INFORMATION
##############################################

#api_gateway_role_name        = "int-global-traffic-network-apigateway-logs"
lambda_role_name = "TrafficLambdaAutomation"
#nuke_account_role_name       = "int-global-traffic-network-nuke-account-role"
#stepfunction_role_name       = "int-global-traffic-network-stepfunction-role"
#vpc_id                       = "vpc-018e400fd8fb9cf0a"
#portal_resources_bucket_name = "int-global-resources.aws.bmw.cloud"
#cdh_api_gateway_account_id   = "402318116903"

##############################################
# WAF LOGGING INFORMATIONS
##############################################

#waf_api_gateway_web_acl_name = "FMManagedWebACLV2-BMW-WAFPolicy-Standard-API-Gateway-1664886046969"
#waf_cloudfront_web_acl_name  = "FMManagedWebACLV2-BMW-WAFPolicy-Standard-CloudFront-1664885997547"
#waf_s3_logging_bucket_arn    = "arn:aws:s3:::aws-waf-logs-104485279185-us-east-2"

##############################################
# COGNITO USER POOL INFORMATION
##############################################

#cognito_trigger_role_name        = "int-global-traffic-network-cognito-trigger-role"
#cognito_user_pool_name           = "int-global-traffic-network-idp"
#is_oidc_idp_connected            = true
#cognito_oidc_provider_name       = "BMWWebEAM"
#cognito_oidc_provider_identifier = "BMW WebEAM int-global Environment"
#webeam_client_id                 = "xxxx"
#webeam_client_secret             = "xxxx"

#cognito_client_specs = {
#  allowed_oauth_flows  = ["code"]
#  allowed_oauth_scopes = ["phone", "email", "openid", "aws.cognito.signin.user.admin", "profile"]
#  callback_urls        = ["https://int.manage.aws.bmw.cloud/", "https://auth.bmwgroup.com/auth/XUI/?realm=/internetb2xmfaonly"]
#  logout_urls = [
#    "https://authorization-dev.bmw.cloud/logoutsaml?origin=https://int.manage.aws.bmw.cloud/",
#    "https://authorization.bmw.cloud/logoutsaml?origin=https://int.manage.aws.bmw.cloud/",
#    "https://int.manage.aws.bmw.cloud/",
#    "https://auth.bmwgroup.com/auth/XUI/?realm=/internetb2xmfaonly",
#  ]
#}

##############################################
# DYNAMODB TABLE INFORMATION
##############################################

#prefix_dynamodb                         = "int-global"
#dynamodb_point_in_time_recovery_enabled = true
#backup_plan_cron_expression             = "0 0 1 * ? *" # TODO
#replication_backup_settings = [{
#  backup_plan_cold_storage_after = 30,
#  backup_plan_delete_after       = 120
#}]

##############################################
# IMPORT REMOTE INFORMATION
##############################################

import_prefix = "int-global"

##############################################
# PORTAL FRONTEND API DEPLOYMENT INFORMATION
##############################################

# ATTENTION: value for cognito_user_pool_arn is the output value of the cognito deployment
#cognito_user_pool_arn = "arn:aws:cognito-idp:us-east-2:557071074234:userpool/us-east-2_O3HbJbRXE"

lambda_logging_level                     = "DEBUG"
enable_cloudwatch_rules                  = true
#lambda_trigger_dynamodb_enabled          = false
lambda_trigger_sqs_enabled               = true
lambda_max_age_for_dynamo_records_in_sec = 60
lambda_max_retry_for_dynamo_records      = 2

#3rd party
#splunk_acc_queue_url              = "https://sqs.us-east-2.amazonaws.com.cn/028636185712/CloudPortalQueue-028636185712-us-east-2"
#four_wheels_automation_account_id = "387646815508"

##############################################
# PORTAL USER API DEPLOYMENT INFORMATION
##############################################

#user_api_quota_limit = 5000

##############################################
# ACCOUNT VENDING MACHINE DEPLOYMENT INFORMATION
##############################################

#specific_lambda_functions_specs = {
#  deploy-stacks = {
#    description      = "Account Vending Machine - Deployment of CloudFormation Stacks"
#    memory_size      = 128
#    timeout          = 900
#    source_file_path = "../../../src/account_vending_machine/creation/deploy_stacks.py"
#    output_file_path = "../../../build/deploy_stacks.zip"
#    handler          = "deploy_stacks.lambda_handler"
#  }
#}
#
#placeholder_lambda_key_map = {
#  deploy_stacks_arn = "deploy-stacks"
#}

##############################################
# PORTAL CONFIG DEPLOYMENT INFORMATION
##############################################

#portal_config_env        = "int-global"
#portal_config_env_parent = null
#partition                = "aws"
##############################################
# EMAIL TEMPLATES DEPLOYMENT INFORMATION
##############################################

#email_templates_env    = "china"
#email_templates_prefix = "email_templates_test"

##############################################
# EMAIL SENDING INFORMATION
##############################################

#email_store_only = true
