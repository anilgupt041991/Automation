# -- Service role for AWS Config -- #
module "config_service_role" {
  source           = "../iam/iam-assumable-role"
  count            = local.create_service_role ? 1 : 0
  role_name        = local.config_role_name
  trusted_services = ["config"]
  trusted_arns     = [local.lambda_role_arn]
}

resource "aws_iam_role_policy_attachment" "attach_config" {
  count      = local.create_service_role ? 1 : 0
  role       = module.config_service_role[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy_attachment" "attach_read_only" {
  count      = local.create_service_role ? 1 : 0
  role       = module.config_service_role[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


# -- Execution role for AWS Config Lambda function #
module "config_execution_role" {
  count            = local.create_execution_role ? 1 : 0
  source           = "../iam/iam-assumable-role"
  role_name        = local.lambda_role_name
  trusted_services = ["lambda"]
}

resource "aws_iam_role_policy_attachment" "attach_lambda" {
  count      = local.create_execution_role ? 1 : 0
  role       = module.config_execution_role[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRulesExecutionRole"
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_write" {
  count      = local.create_execution_role ? 1 : 0
  role       = module.config_execution_role[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "lambda_config_policy" {
  count  = local.create_execution_role ? 1 : 0
  name   = local.lambda_role_name
  policy = data.aws_iam_policy_document.lambda_config_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_config_policy_attach" {
  count      = local.create_execution_role ? 1 : 0
  role       = module.config_execution_role[count.index].name
  policy_arn = aws_iam_policy.lambda_config_policy[count.index].arn
}

data "aws_iam_policy_document" "lambda_config_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    # resources = formatlist("arn:aws:iam::%s:role/project-*-config-service-role", var.managed_account_ids)
    resources = ["*"]
  }
}
