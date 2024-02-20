variable "role_name" {}

variable "trusted_arns" {
  type    = list(any)
  default = []
}

variable "trusted_services" {
  type    = list(any)
  default = []
}
