resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${local.tag_prefix}-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  count  = length(aws_subnet.private.*.id)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.gw.*.id, count.index)
  }

  tags = {
    Name = "${local.tag_prefix}-private-${count.index}"
  }
}

# resource "aws_route_table" "private2" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.gw2.id
#   }

#   tags = {
#     Name = "private2"
#   }
# }