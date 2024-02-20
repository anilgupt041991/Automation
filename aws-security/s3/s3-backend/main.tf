resource "aws_s3_bucket" "state_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket              = aws_s3_bucket.state_bucket.id
  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
}
