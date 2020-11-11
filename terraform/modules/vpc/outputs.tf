output "vpc_id" {
  description = "The id of the VPC to create the network services"
  value       = var.create_vpc ? local.vpc_id : var.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block from the VPC."
  value       = aws_vpc.custom_vpc.*.cidr_block
}

output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.azs
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.private.*.id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = aws_subnet.public.*.cidr_block
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = aws_subnet.private.*.cidr_block
}

