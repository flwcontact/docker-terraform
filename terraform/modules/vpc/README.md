# VPC Terraform Module

Terraform module which creates VPC resources on AWS.

## Usage

```hcl
module "vpc" {
  source = "../../modules/vpc"

  create_vpc     = true
  vpc_cidr_block = "10.10.0.0/16"
  azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  tags = {
    Environment = "test"
  }

  public_subnets_tags = {
    SubnetType = "Public",
  }

  private_subnets_tags = {
    SubnetType = "Private",
  }
}
```
