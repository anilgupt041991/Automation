resource "aws_quicksight_group" "example" {
  group_name = "tf-example"
  namespace  = "default"
}


resource "aws_quicksight_user" "example-1" {
  session_name  = "author"
  email         = "anil.gupta@zscaler.com"
  identity_type = "IAM"
  namespace     = "default"
  iam_arn       = "arn:aws:iam::090717643658:role/quicksight"
  user_role     = "ADMIN"
}
