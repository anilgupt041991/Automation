resource "aws_iam_user" "security_user" {
  count = local.security_account ? 1 : 0
  name  = "project-${var.environment}-security-user"
}

resource "aws_iam_user" "developer_user" {
  count = local.security_account ? 1 : 0
  name  = "project-${var.environment}-developer-user"
}