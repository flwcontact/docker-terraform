module "vpc-prod" {
  source = "../modules/vpc"
  create_vpc     = true
  vpc_cidr_block = "10.123.0.0/16"
  azs            = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  public_subnets = ["10.123.1.0/24", "10.123.2.0/24", "10.123.3.0/24"]
  private_subnets = ["10.123.4.0/24", "10.123.5.0/24", "10.123.6.0/24"]

  tags = {
    Name = "fake-product-production",
    Environment = "production"
  }
  public_subnets_tags = {
    SubnetType = "Public"
  }
  private_subnets_tags = {
    SubnetType = "Private"
  }
}
