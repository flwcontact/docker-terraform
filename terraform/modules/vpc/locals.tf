locals {
  vpc_id = element(
    concat(
      aws_vpc.custom_vpc.*.id,
      [""],
    ),
    0,
  )
}
