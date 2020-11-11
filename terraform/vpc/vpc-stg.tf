module "vpc-stg" {
  source = "../modules/vpc"
  create_vpc     = true
  vpc_cidr_block = "10.234.0.0/16"
  azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  public_subnets = ["10.234.1.0/24", "10.234.2.0/24", "10.234.3.0/24"]
  private_subnets = ["10.234.4.0/24", "10.234.5.0/24", "10.234.6.0/24"]

  tags = {
    Name = "Fake-product-staging",
    Environment = "staging"
  }
  public_subnets_tags = {
    SubnetType = "Public"
  }
  private_subnets_tags = {
    SubnetType = "Private"
  }
}
