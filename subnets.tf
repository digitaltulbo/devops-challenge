resource "aws_subnet" "public_1" {

  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.0.1.0/24"

  # The AZ for the subnet.
  availability_zone = "ap-northeast-2a"

  # Required for EKS.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                        = "public-ap-northeast-2a"
    "kubernetes.io/cluster/eks" = "owned"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {

  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.0.2.0/24"

  # The AZ for the subnet.
  availability_zone = "ap-northeast-2c"

  # Required for EKS.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                        = "public-ap-northeast-2c"
    "kubernetes.io/cluster/eks" = "owned"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_1" {

  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.0.10.0/24"

  # The AZ for the subnet.
  availability_zone = "ap-northeast-2a"

  # Required for EKS.
  # map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-ap-northeast-2a"
    "kubernetes.io/cluster/eks"       = "owned"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {

  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "10.0.20.0/24"

  # The AZ for the subnet.
  availability_zone = "ap-northeast-2c"

  # Required for EKS.
  # map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-ap-northeast-2c"
    "kubernetes.io/cluster/eks"       = "owned"
    "kubernetes.io/role/internal-elb" = 1
  }
}
