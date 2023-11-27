# Resource: aws_vpc
# Provides a VPC resource
resource "aws_vpc" "vpc_uribe" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = merge(
    var.info_tags, {
      Name = "vpc_uribe"
    }
  )
}

# Resource: aws_internet_gateway
# Provides a resource to create a VPC Internet Gateway
resource "aws_internet_gateway" "gw_uribe" {
  vpc_id = aws_vpc.vpc_uribe.id

  tags = merge(
    var.info_tags, {
      Name = "internet_gateway_uribe"
    }
  )
}