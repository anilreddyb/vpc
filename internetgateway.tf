# # data "aws_vpc" "main" {
# #   id = "vpc-0e8738a3569121ef2"

# # }

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}