data "archive_file" "rule_zip" {
  count            = var.create_lambda ? 1 : 0
  type             = "zip"
  output_file_mode = "0666"
  output_path      = local.rule_zip

  source {
    content  = file(local.rule_code)
    filename = "${var.rule_name}.py"
  }
}

resource "aws_lambda_function" "config_rule" {
  count            = var.create_lambda ? 1 : 0
  function_name    = local.rule_lambda_name
  description      = "Create a new AWS lambda function for rule code"
  runtime          = var.source_runtime
  handler          = var.source_handler
  role             = var.lambda_role_arn
  timeout          = var.lambda_timeout
  filename         = local.rule_zip
  source_code_hash = filebase64sha256(local.rule_zip)
  layers           = var.lambda_layers
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
}

resource "aws_lambda_permission" "lambda_invoke" {
  count         = var.create_lambda ? 1 : 0
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.config_rule[count.index].arn
  principal     = "config.amazonaws.com"
  statement_id  = "AllowExecutionFromConfig"
  depends_on = [
    aws_lambda_function.config_rule,
  ]
}
