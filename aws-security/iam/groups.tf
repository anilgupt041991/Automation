module "developer_group" {
  count  = local.security_account ? 1 : 0
  source = "./iam-group"
  name   = local.developer_group_name
  assumable_roles = concat(
    # remove the security account roles 
    compact(
      [for role in formatlist("arn:aws:iam::%v:role/%v-role", 
      values(var.managed_accounts), 
      local.create_read_update_prefix)
      : length(regexall(var.aws_account_id, role)) > 0 ? "" : role
      ]),
    compact(
      [for role in formatlist("arn:aws:iam::%v:role/%v-role", 
      values(var.managed_accounts),
      local.delete_prefix)
      : length(regexall(var.aws_account_id, role)) > 0 ? "" : role
      ]),
  )
  group_users = [
    aws_iam_user.developer_user[count.index].name
  ]
}

resource "aws_iam_group_policy_attachment" "developer_access_policy" {
  count      = local.security_account ? 1 : 0
  group      = module.developer_group[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

module "security_group" {
  count  = local.security_account ? 1 : 0
  source = "./iam-group"
  name   = local.security_group_name
  assumable_roles = concat(
    formatlist("arn:aws:iam::%v:role/project-%v-%v-role", values(var.managed_accounts), var.environment, "create-read-update"),
    formatlist("arn:aws:iam::%v:role/project-%v-%v-role", values(var.managed_accounts), var.environment, "delete"),
  )
  group_users = [
    aws_iam_user.security_user[count.index].name
  ]
}

resource "aws_iam_group_policy_attachment" "security_access_policy" {
  count      = local.security_account ? 1 : 0
  group      = module.security_group[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
