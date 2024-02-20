/*  
    Create a policy with permissions to delete resources
*/
resource "aws_iam_policy" "delete_policy" {
  name   = "${local.delete_prefix}-policy"
  policy = data.aws_iam_policy_document.delete_policy.json
}

data "aws_iam_policy_document" "delete_policy" {
  statement {
    sid    = "AllowListActions"
    effect = "Allow"
    actions = [
      "acm:Describe*",
      "acm:Get*",
      "acm:List*",
      "cloudfront:Describe*",
      "cloudfront:Get*",
      "cloudfront:List*",
      "config:Describe*",
      "config:Get*",
      "config:List*",
      "ec2:Describe*",
      "ec2:Get*",
      "eks:Describe*",
      "eks:List*",
      "iam:Get*",
      "iam:List*",
      "lambda:Get*",
      "lambda:List*",
      "rds:Describe*",
      "rds:List*",
      "s3:Get*",
      "s3:List*",
      "secretsmanager:Describe*",
      "secretsmanager:Get*",
      "secretsmanager:List*",
      "waf:Get*",
      "waf:List*",
      "wafv2:Get*",
      "wafv2:List*",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowDeleteActions"
    effect = "Allow"
    actions = [
      "acm:Delete*",
      "cloudfront:Delete*",
      "config:Delete*",
      "rds:Delete*",
      "ec2:Delete*",
      "ecr:Delete*",
      "eks:Delete*",
      "iam:Delete*",
      "lambda:Delete*",
      "lambda:Remove*",
      "lambda:Untag*",
      "s3:Delete*",
      "wafv2:Delete*",
      "iam:Detach*"
    ]
    resources = ["*"]
  }
}
