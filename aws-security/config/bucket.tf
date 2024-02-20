resource "aws_s3_bucket" "config_bucket" {
  count  = local.create_bucket ? 1 : 0
  bucket = var.config_log_bucket
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "block_access" {
  count               = local.create_bucket ? 1 : 0
  bucket              = aws_s3_bucket.config_bucket[count.index].id
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_policy" "config_bucket_policy" {
  count  = local.create_bucket ? 1 : 0
  bucket = aws_s3_bucket.config_bucket[0].id
  policy = data.aws_iam_policy_document.config_bucket_policy[0].json
}

data "aws_iam_policy_document" "config_bucket_policy" {
  count = local.create_bucket ? 1 : 0
  statement {
    actions = [
      "s3:GetBucketAcl",
      "s3:ListBucket",
    ]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = values(var.managed_accounts)
    }
    resources = ["arn:aws:s3:::${aws_s3_bucket.config_bucket[0].id}"]
  }

  statement {
    actions = [
      "s3:PutObject",
    ]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = values(var.managed_accounts)
    }
    resources = ["arn:aws:s3:::${aws_s3_bucket.config_bucket[0].id}/AWSLogs/*"]
  }
}
