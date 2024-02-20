variable "aws_region" {}

variable "environment" {}

variable "rule_name" {
  type        = string
  description = "Rule name to export."
}

variable "source_runtime" {
  type        = string
  description = "Runtime for lambda function."
}

variable "source_handler" {
  type        = string
  description = "Rule name to export."
}

variable "subnet_ids" {
  description = "Comma-separated list of Subnets to deploy your Lambda function(s)."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Comma-separated list of Security Groups to deploy with your Lambda function(s)."
  type        = list(string)
  default     = []
}

variable "source_events" {
  description = "Resource types that will trigger event-based Rule evaluation."
  type        = list(string)
}


variable "source_input_parameters" {
  description = "JSON for required and optional Config parameters."
  type        = string
}

variable "lambda_layers" {
  type        = list(string)
  description = "Comma-separated list of Lambda Layer ARNs to deploy with your Lambda function(s)."
}


variable "source_periodic" {
  description = "Maximum execution frequency for scheduled Rules."
  type        = string
}

variable "lambda_role_arn" {
  description = "Assign iam role to lambda functions."
  type        = string
}

variable "lambda_timeout" {
  description = "Lambda function timeout"
  type        = string
}

variable "lambda_account_id" {}

variable "primary_region" {}

variable "create_lambda" {}

locals {
  update_source      = var.create_lambda && var.aws_region == var.primary_region
  rule_lambda_name   = "project-${var.environment}-config-${var.rule_name}"
  event_triggered    = (length(var.source_events) > 0 ? true : false)
  periodic_triggered = var.source_periodic != "NONE" ? true : false
  rule_zip           = format("%s.zip", var.rule_name)
  rule_code          = format("${path.root}/config-code/%s/%s.py", var.rule_name, var.rule_name)
}
