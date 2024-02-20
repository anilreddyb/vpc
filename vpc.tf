resource "aws_vpc" "main" {
  cidr_block           = var.primary_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = "main"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.secondary_cidr
}