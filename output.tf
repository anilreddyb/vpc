output "vpc_id" {
  value       = aws_vpc.main.id
  description = "vpc id"
  sensitive   = false

}
output "internetgateway_id" {
  value       = aws_internet_gateway.gw.id
  description = "Internet gateway Id"

}
output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "private subnet ids"

}
# output "private_subnet_2" {
#   value       = aws_subnet.private_subnet_2.id
#   description = "private subnet id 1"

# }
output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "public subnet ids"

}
# output "public_subnet_2" {
#   value       = aws_subnet.public_subnet_2.id
#   description = "public subnet id 1"

# }

output "eips" {
  value = aws_eip.nat.*.public_ip
}
# output "eip-2" {
#   value = aws_eip.nat2.public_ip

# }
output "nat-ids" {
  value = aws_nat_gateway.gw.*.id

}
# output "nat-2" {
#   value = aws_nat_gateway.gw2.id

# }

output "secondary_cidr" {
  value = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id

}

