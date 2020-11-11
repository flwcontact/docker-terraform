resource "aws_vpc" "custom_vpc" {
  count = var.create_vpc ? 1 : 0

  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    {
      Name = "test",
    },
    var.tags,
  )
}
