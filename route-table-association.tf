resource "aws_route_table_association" "public" {
  count     = 2
  subnet_id = element(aws_route_table.public.*.id, count.index)
  # subnet_id = aws_route_table.public[count.index].id
  # route_table_id = element(aws_route_table.public.*.id,count.index)
  route_table_id = aws_route_table.public.id
}
# resource "aws_route_table_association" "public2" {
#   subnet_id      = aws_subnet.public_subnet_2.id
#   route_table_id = aws_route_table.public.id
# }
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private.*.id)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
# resource "aws_route_table_association" "private2" {
#   subnet_id      = aws_subnet.private_subnet_2.id
#   route_table_id = aws_route_table.private2.id
# }