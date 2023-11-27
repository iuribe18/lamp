# Public Subnet
resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.vpc_uribe.id
  cidr_block = var.network_cidr[0]
  # cidr_block = "10.0.1.0/24"
  # Asignación automática de IP
  map_public_ip_on_launch = true
  # AZ or the subnet (Optional)
  availability_zone = var.az[0]
  # us-west-2a
  # count = 2

  tags = merge(
    var.info_tags, {
      Name = var.network_name[0]
      # Public Subnet
    }
  )
}

# Private Subnet
/*resource "aws_subnet" "Subnet_Private" {
  vpc_id     = aws_vpc.VPC_Pragma.id
  cidr_block = var.CIDR_Private[1]
  # cidr_block = "10.0.2.0/24"
  # Asignación automática de IP
  map_public_ip_on_launch = false
  # AZ or the subnet (Optional)
  availability_zone = var.az[1]
  # us-west-2a
  tags = merge(
    var.info_tags, {
      Name = var.Subnet_Public[0]
      # Private Subnet
    }
  )
}*/