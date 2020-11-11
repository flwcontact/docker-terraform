terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "terraform-state-files-as"
    key    = "s3.tfstate"
    region = "eu-west-1"
  }
}
