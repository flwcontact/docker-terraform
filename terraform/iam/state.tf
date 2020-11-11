terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "terraform-state-files-as"
    key    = "iam.tfstate"
    region = "eu-west-1"
  }
}
