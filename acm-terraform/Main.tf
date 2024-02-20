resource "tls_private_key" "example" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "example" {
  #key_algorithm   = "RSA"
  private_key_pem = tls_private_key.example.private_key_pem

  subject {
    common_name  = "test-us-zsense.zcpcloud.net"
    organization = "ZS"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "cert" {
  private_key       = file("privateKeyFileInPemFormat.pem")
  certificate_body  = file("us-zsense_zcpcloud_net.crt")
  certificate_chain = file("chain")
}