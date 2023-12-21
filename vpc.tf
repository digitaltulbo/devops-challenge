resource "aws_vpc" "main" {
  # The CIDR block for the VPC.
  cidr_block = "10.0.0.0/16"

  # Make your instances shared on the hosts.
  instance_tenancy = "default"

  # Required for EKS. Enable/disable DNS support in the VPC.
  enable_dns_support = true
  # Required for EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length

  tags = {
    Name = "main"
  }
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC id."
  sensitive   = false
}
