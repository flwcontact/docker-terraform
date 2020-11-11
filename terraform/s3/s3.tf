resource "aws_s3_bucket" "fake_s3_bucket" {
  bucket = local.bucket_name
  acl    = "private"

  tags = {
    Name       = local.bucket_name
    managed_by = "terraform"
  }
}
