resource "aws_config_config_rule" "event_triggered" {
  count       = local.event_triggered ? 1 : 0
  name        = format("%s_event", var.rule_name)
  description = var.rule_name
  scope {
    compliance_resource_types = var.source_events
  }
  input_parameters = var.source_input_parameters
  source {
    owner             = "CUSTOM_LAMBDA"
    source_identifier = var.create_lambda ? aws_lambda_function.config_rule[0].arn : "arn:aws:lambda:${var.aws_region}:${var.lambda_account_id}:function:${local.rule_lambda_name}"
    source_detail {
      event_source = "aws.config"
      message_type = "ConfigurationItemChangeNotification"
    }
  }
}

resource "aws_config_config_rule" "periodic_triggered_rule" {
  count       = local.periodic_triggered ? 1 : 0
  name        = format("%s_periodic", var.rule_name)
  description = var.rule_name

  input_parameters = var.source_input_parameters
  source {
    owner             = "CUSTOM_LAMBDA"
    source_identifier = var.create_lambda ? aws_lambda_function.config_rule[0].arn : "arn:aws:lambda:${var.aws_region}:${var.lambda_account_id}:function:${local.rule_lambda_name}"
    source_detail {
      event_source                = "aws.config"
      message_type                = "ScheduledNotification"
      maximum_execution_frequency = var.source_periodic
    }
  }
}
