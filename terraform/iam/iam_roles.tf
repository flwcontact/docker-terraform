resource "aws_iam_instance_profile" "rw-s3-fake-product-assets" {
  name = "rw-s3-fake-product-assets"
  role = aws_iam_role.rw-s3-fake-product-assets.name
}

resource "aws_iam_role" "rw-s3-fake-product-assets" {
  name = "rw-s3-fake-product-assets"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
