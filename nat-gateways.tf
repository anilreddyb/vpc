resource "aws_nat_gateway" "gw" {
  count         = length(aws_eip.nat.*.id)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = "${local.tag_prefix}-NAT-${count.index}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.nat]
}

# resource "aws_nat_gateway" "gw2" {
#   allocation_id = aws_eip.nat2.id
#   subnet_id     = aws_subnet.public_subnet_2.id

#   tags = {
#     Name = "NAT 2"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_eip.nat2]
# }