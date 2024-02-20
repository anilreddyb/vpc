resource "aws_subnet" "public" {
  count                   = length(var.public_cidr_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr_block[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  # A map of tags to assign to the resources
  tags = {
    Name                        = "${local.tag_prefix}-subnet-${count.index}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr_block[count.index]
  availability_zone = var.availability_zone[count.index]

  # A map of tags to assign to the resources
  tags = {
    Name                        = "${local.tag_prefix}-subnet-${count.index}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

# resource "aws_subnet" "public_subnet_2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "192.168.64.0/18"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   # A map of tags to assign to the resources
#   tags = {
#     Name                        = "public-us-east-1b"
#     "kubernetes.io/cluster/eks" = "shared"
#     "kubernetes.io/role/elb"    = 1
#   }
# }

# resource "aws_subnet" "private_subnet_1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "192.168.128.0/18"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = false

#   # A map of tags to assign to the resources
#   tags = {
#     Name                        = "private-us-east-1a"
#     "kubernetes.io/cluster/eks" = "shared"
#     "kubernetes.io/role/elb"    = 1
#   }
# }

# resource "aws_subnet" "private_subnet_2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "192.168.192.0/18"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = false

#   # A map of tags to assign to the resources
#   tags = {
#     Name                        = "private-us-east-1b"
#     "kubernetes.io/cluster/eks" = "shared"
#     "kubernetes.io/role/elb"    = 1
#   }
# }