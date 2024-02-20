variable "config_log_bucket" {
  description = "The bucket where AWS Config logs are stored"
}

variable "allowed_regions" {
  type = list(any)
}

variable "account_name" {}

variable "aws_account_id" {}

variable "aws_region" {}

variable "environment" {}

variable "recorder_enabled" {
  default = true
}

variable "trusted_account_id" {}

variable "managed_accounts" {
  type = map(any)
}

variable "primary_region" {}

locals {
  security_account = var.account_name == "security" ? true : false

  # All files in the config-code directory
  all_files = fileset("${path.module}/config-code", "**")

  # All directories that contain a .tfvars.json file within them
  rule_dirs = [for file in local.all_files :
    dirname(file) if substr(file, -12, -1) == ".tfvars.json"
  ]

  # Mapping of directory name => parameters from .tfvars.json
  rules = { for file in local.rule_dirs :
    file => jsondecode(file("config-code/${file}/${file}.tfvars.json"))
  }

  # Record global resources only from one region
  record_global         = var.aws_region == var.primary_region
  create_service_role   = local.record_global
  create_execution_role = local.security_account && local.create_service_role
  create_bucket         = local.create_execution_role

  # Lambda execution role (exists only in the security account)
  lambda_role_name = "project-${var.environment}-security-config-execution-role"
  lambda_role_arn  = "arn:aws:iam::${var.trusted_account_id}:role/${local.lambda_role_name}"

  # Config service role (exists in all managed accounts)
  config_role_name = "project-${var.environment}-${var.account_name}-config-service-role"
  config_role_arn  = "arn:aws:iam::${var.aws_account_id}:role/${local.config_role_name}"
}