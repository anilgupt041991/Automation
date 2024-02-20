/*  
    Create a policy with permissions to create, read, and update resources
*/
resource "aws_iam_policy" "create_read_update_policy" {
  name   = "${local.create_read_update_prefix}-policy"
  policy = data.aws_iam_policy_document.create_read_update_policy.json
}

data "aws_iam_policy_document" "create_read_update_policy" {
  statement {
    sid = "AllowCreateActionsInSpecificRegions"
    actions = [
      "acm:Add*",

      "cloudfront:Create*",

      "ec2:Create*",

      "eks:Create*",

      "lambda:Create*",
      "lambda:Publish*",

      "rds:Add*",
      "rds:Create*",

      "secretsmanager:Create*",

      "waf:Create*",

      "wafv2:Create*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = var.allowed_regions
    }
    resources = ["*"]
  }

  statement {
    sid    = "AllowGlobalCreate"
    effect = "Allow"
    actions = [
      "s3:Create*",
      "iam:Create*",
    ]
    resources = ["*"]
  }

  statement {
    sid = "AllowReadActions"
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
    sid = "AllowUpdateActions"
    actions = [
      "acm:Put*",

      "cloudfront:Update*",

      "config:Put*",

      "ec2:Put*",

      "eks:Update*",

      "iam:Add*",
      "iam:Attach*",
      "iam:Put*",
      "iam:Update*",

      "lambda:Add*",
      "lambda:Put*",
      "lambda:Update*",

      "s3:Put*",

      "secretsmanager:Put*",
      "secretsmanager:Update*",

      "waf:Put*",
      "waf:Update*",

      "wafv2:Put*",
      "wafv2:Update*",
    ]
    resources = ["*"]
  }

  statement {
    sid = "AllowMiscellaneousActions"
    actions = [
      "acm:Export*",
      "acm:Import*",
      "acm:RemoveTagsFromCertificate",
      "acm:RenewCertificate",
      "acm:RequestCertificate",
      "acm:ResendValidationEmail",
      "acm:UpdateCertificateOptions",

      "cloudfront:AssociateAlias",
      "cloudfront:PublishFunction",
      "cloudfront:TagResource",
      "cloudfront:TestFunction",
      "cloudfront:UntagResource",

      "config:Start*",
      "config:Stop*",
      "config:Tag*",

      "ec2:Attach*",
      "ec2:Detach*",
      "ec2:Disable*",
      "ec2:Enable*",
      "ec2:Import*",
      "ec2:Modify*",
      "ec2:Run*",
      "ec2:Start*",

      "iam:PassRole",
      "iam:Tag*",
      "iam:Untag*",

      "lambda:InvokeFunction",
      "lambda:Tag*",

      "rds:Copy*",
      "rds:Remove*",
      "rds:Restore*",
      "rds:Start*",
      "rds:Stop*",
    ]
    resources = ["*"]
  }

  statement {
    sid       = "AllowPolicyVersionDeletion"
    effect    = "Allow"
    actions   = ["iam:DeletePolicyVersion"]
    resources = ["*"]
  }
}
