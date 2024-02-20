output "name" {
  value = aws_iam_group.group.name
}

output "arn" {
  value = aws_iam_group.group.arn
}

output "assumable_roles" {
  value = var.assumable_roles
}

output "group_users" {
  value = var.group_users
}
