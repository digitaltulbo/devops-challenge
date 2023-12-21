# resource "aws_route_table_association" "public1" {
#   # The subnet ID to create an association.
#   subnet_id = aws_subnet.public_1.id

#   # The ID of the routing table to associate with.
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public2" {
#   # The subnet ID to create an association.
#   subnet_id = aws_subnet.public_2.id

#   # The ID of the routing table to associate with.
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private1" {
#   # The subnet ID to create an association.
#   subnet_id = aws_subnet.private_1.id

#   # The ID of the routing table to associate with.
#   route_table_id = aws_route_table.private1.id
# }

# resource "aws_route_table_association" "private2" {
#   # The subnet ID to create an association.
#   subnet_id = aws_subnet.private_2.id

#   # The ID of the routing table to associate with.
#   route_table_id = aws_route_table.private2.id
# }

resource "aws_route_table_association" "private_ap_northeast_2a" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_ap_northeast_2b" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_ap_northeast_2a" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_1.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_ap_northeast_2b" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public_2.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}
