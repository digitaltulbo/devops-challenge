# resource "aws_eip" "nat1" {
#   # RIP may require IGW to exist pror to association.
#   # Use depends_on to set an explicit dependency on the IGW.
#   depends_on = [aws_internet_gateway.main]
# }

# resource "aws_eip" "nat2" {
#   # RIP may require IGW to exist pror to association.
#   # Use depends_on to set an explicit dependency on the IGW.
#   depends_on = [aws_internet_gateway.main]
# }

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat"
  }
}
