/*
    Create a role with create, read, and update permissions to resources
*/
module "create_read_update_role" {
  source       = "./iam-assumable-role"
  role_name    = "${local.create_read_update_prefix}-role"
  trusted_arns = ["arn:aws:iam::${var.trusted_account_id}:root"]
}

resource "aws_iam_role_policy_attachment" "attach_create_read_update_policy" {
  role       = module.create_read_update_role.name
  policy_arn = aws_iam_policy.create_read_update_policy.arn
}

/*
    Create a role with delete permissions to resources
*/
module "delete_role" {
  source       = "./iam-assumable-role"
  role_name    = "${local.delete_prefix}-role"
  trusted_arns = ["arn:aws:iam::${var.trusted_account_id}:root"]
}

resource "aws_iam_role_policy_attachment" "attach_delete_policy" {
  role       = module.delete_role.name
  policy_arn = aws_iam_policy.delete_policy.arn
}

/*
    Create a role for SEIM to list and read buckets in security account central bucket for Cloudtrail,VPC logs and DNS logs
*/
module "seim_role" {
  source       = "./iam-assumable-role"
  role_name    = "${local.seim_prefix}-role"
  trusted_arns = ["arn:aws:iam::${var.trusted_account_id}:root"]
}

resource "aws_iam_role_policy_attachment" "attach_seim_policy" {
  role       = module.seim_role.name
  policy_arn = aws_iam_policy.seim_policy.arn
}
