resource "aws_iam_user_policy_attachment" "attach-admin-to-emma" {
  user       = aws_iam_user.emma.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "attach-admin-to-liam" {
  user       = aws_iam_user.liam.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy" "s3-rw-policy" {
  name        = "s3-rw-policy"
  description = "s3 Read and Write policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:PutObject"  
            ], 
            "Resource": "arn:aws:s3:::fake-product-assets"
        }
    ]
}
  EOF
}

resource "aws_iam_role_policy_attachment" "attach-s3-rw-policy-to-role" {
  role       = aws_iam_role.rw-s3-fake-product-assets.name
  policy_arn = aws_iam_policy.s3-rw-policy.arn
}
