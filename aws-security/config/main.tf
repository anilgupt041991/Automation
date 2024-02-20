resource "aws_config_configuration_recorder" "recorder" {
  name     = "project-${var.environment}-${var.account_name}-configuration-recorder"
  role_arn = local.config_role_arn
  recording_group {
    all_supported                 = true
    include_global_resource_types = local.record_global
  }
}

resource "aws_config_delivery_channel" "delivery_channel" {
  name           = "project-${var.environment}-${var.account_name}-delivery-channel"
  s3_bucket_name = var.config_log_bucket
  depends_on = [
    aws_config_configuration_recorder.recorder,
  ]
}

resource "aws_config_configuration_recorder_status" "recorder_status" {
  name       = aws_config_configuration_recorder.recorder.name
  is_enabled = var.recorder_enabled
  depends_on = [
    aws_config_delivery_channel.delivery_channel,
  ]
}
