resource "aws_iam_instance_profile" "fake-product" {
  name = "fake-product"
  role = aws_iam_role.fake-product.name
}

resource "aws_iam_role" "fake-product" {
  name = "fake-product"
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
