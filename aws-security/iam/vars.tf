variable "account_name" {}

variable "aws_account_id" {}

variable "allowed_regions" {
  type = list(any)
}

variable "managed_accounts" {
  type = map(string)
}

variable "trusted_account_id" {}

variable "environment" {}

locals {
  security_account = var.account_name == "security" ? true : false

  developer_group_name = "project-${var.environment}-developer-group"
  security_group_name  = "project-${var.environment}-security-group"

  create_read_update_prefix = "project-${var.environment}-create-read-update"
  delete_prefix             = "project-${var.environment}-delete"
  seim_prefix               = "Internal-Security-Audit-Role"
}
