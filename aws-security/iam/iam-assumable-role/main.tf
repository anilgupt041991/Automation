# Allow accounts to be assumed by any entity in the trusted account
data "aws_iam_policy_document" "aws_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.trusted_arns
    }
  }
}

data "aws_iam_policy_document" "service_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = formatlist("%s.amazonaws.com", var.trusted_services)
    }
  }
}

data "aws_iam_policy_document" "merged_assume_role_policy" {
  source_policy_documents = [
    data.aws_iam_policy_document.aws_assume_role_policy.json,
    data.aws_iam_policy_document.service_assume_role_policy.json,
  ]
}

resource "aws_iam_role" "role" {
  name = var.role_name
  assume_role_policy = (
    length(var.trusted_arns) > 0 && length(var.trusted_services) > 0 ? data.aws_iam_policy_document.merged_assume_role_policy.json : (
      length(var.trusted_arns) > 0 ? data.aws_iam_policy_document.aws_assume_role_policy.json : data.aws_iam_policy_document.service_assume_role_policy.json
    )
  )
}
