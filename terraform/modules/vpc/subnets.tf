resource "aws_subnet" "public" {
  count = length(var.azs)

  vpc_id            = var.create_vpc ? local.vpc_id : var.vpc_id
  cidr_block        = length(var.public_subnets) > 0 ? var.public_subnets[count.index] : cidrsubnet(var.vpc_cidr_block, ceil(log(length(var.azs) * 2, 2)), length(var.azs) + count.index)
  availability_zone = var.azs[count.index]

  tags = merge(
    {
      Name = format("public-%s", var.azs[count.index])
    },
    var.public_subnets_tags,
  )
}

resource "aws_subnet" "private" {
  count = length(var.azs)

  vpc_id            = var.create_vpc ? local.vpc_id : var.vpc_id
  cidr_block        = length(var.private_subnets) > 0 ? var.private_subnets[count.index] : cidrsubnet(var.vpc_cidr_block, ceil(log(length(var.azs) * 2, 2)), count.index)
  availability_zone = var.azs[count.index]

  tags = merge(
    {
      Name = format("private-%s", var.azs[count.index])
    },
    var.private_subnets_tags,
  )
}
