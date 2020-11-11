terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "terraform-state-files-as"
    key    = "vpc.tfstate"
    region = "eu-west-1"
  }
}
