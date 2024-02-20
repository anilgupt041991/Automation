variable "name" {}

variable "assumable_roles" {
  type = list(any)
}

variable "group_users" {
  type = list(any)
}