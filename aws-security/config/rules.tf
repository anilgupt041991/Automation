module "config_rule" {
  for_each       = local.rules
  source         = "./config-rule"
  aws_region     = var.aws_region
  primary_region = var.primary_region
  environment    = var.environment
  rule_name      = each.key
  source_runtime = each.value.source_runtime
  source_handler = each.value.source_handler
  subnet_ids              = each.value.subnet_ids
  security_group_ids      = each.value.security_group_ids
  source_events           = each.value.source_events
  source_input_parameters = each.value.source_input_parameters
  lambda_layers           = each.value.lambda_layers
  source_periodic         = each.value.source_periodic
  lambda_role_arn         = local.lambda_role_arn
  lambda_timeout          = each.value.lambda_timeout
  lambda_account_id       = var.trusted_account_id
  create_lambda           = local.security_account
  depends_on = [
    aws_s3_bucket.config_bucket,
    module.config_execution_role,
  ]
}
