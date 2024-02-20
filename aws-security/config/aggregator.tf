resource "aws_config_configuration_aggregator" "aggregator" {
  count = local.security_account && var.aws_region == var.primary_region ? 1 : 0
  name  = "project-${var.environment}-config-aggregator"

  account_aggregation_source {
    account_ids = values(var.managed_accounts)
    regions     = var.allowed_regions
  }
}

resource "aws_config_aggregate_authorization" "authorize" {
  account_id = var.trusted_account_id
  region     = var.primary_region
}
