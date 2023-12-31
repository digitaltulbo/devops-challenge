# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     # The CIDR block of the route.
#     cidr_block = "0.0.0.0/0"

#     # Identifier of a VPC internet gateway or a virtual private gateway.
#     gateway_id = aws_internet_gateway.main.id
#   }

#   # A map of tags tp assign to the resourece.
#   tags = {
#     Name = "public"
#   }
# }

# resource "aws_route_table" "private1" {
#   vpc_id = aws_vpc.main.id

#   route {
#     # The CIDR block of the route.
#     cidr_block = "0.0.0.0/0"

#     # Identifier of a VPC NAT gateway.
#     nat_gateway_id = aws_nat_gateway.gw1.id
#   }

#   # A map of tags tp assign to the resourece.
#   tags = {
#     Name = "private1"
#   }
# }

# resource "aws_route_table" "private2" {
#   vpc_id = aws_vpc.main.id

#   route {
#     # The CIDR block of the route.
#     cidr_block = "0.0.0.0/0"

#     # Identifier of a VPC NAT gateway.
#     nat_gateway_id = aws_nat_gateway.gw2.id
#   }

#   # A map of tags tp assign to the resourece.
#   tags = {
#     Name = "private2"
#   }
# }


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway.
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway.
    gateway_id = aws_internet_gateway.main.id
  }

  # A map of tags tp assign to the resourece.
  tags = {
    Name = "public"
  }
}
