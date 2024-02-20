data "aws_iam_policy_document" "assume_role" {
  count = length(var.assumable_roles) > 0 ? 1 : 0
  statement {
    actions   = ["sts:AssumeRole"]
    resources = var.assumable_roles
  }
}

resource "aws_iam_policy" "policy" {
  count  = length(var.assumable_roles) > 0 ? 1 : 0
  name   = var.name
  policy = data.aws_iam_policy_document.assume_role[count.index].json
}

resource "aws_iam_group" "group" {
  name = var.name
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  count      = length(var.assumable_roles) > 0 ? 1 : 0
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy[count.index].arn
}

resource "aws_iam_group_membership" "group_membership" {
  count = length(var.group_users) > 0 ? 1 : 0
  name  = var.name
  users = var.group_users
  group = aws_iam_group.group.name
}