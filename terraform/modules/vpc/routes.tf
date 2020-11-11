resource "aws_route_table" "public" {
  count = length(var.azs)

  vpc_id = var.create_vpc ? local.vpc_id : var.vpc_id

  tags = merge(
    {
      Name = format("public-%s", var.azs[count.index])
    },
  )
}

resource "aws_route_table" "private" {
  count = length(var.azs)

  vpc_id = var.create_vpc ? local.vpc_id : var.vpc_id

  tags = merge(
    {
      Name = format("private-%s", var.azs[count.index])
    },
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.azs)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.azs)

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
