# AWS Public Route Table
# Permitir todo el tráfico de Entrada al Internet_Gateway
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_uribe.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_uribe.id
  }

  tags = merge(
    var.info_tags, {
      Name = var.RouteTable[0]
      # RT_Public
  })
}

# AWS Private Route Table
# Permitir todo el tráfico de Entrada al NAT_Gateway
/*resource "aws_route_table" "RT_Private" {
  vpc_id = aws_vpc.VPC_Pragma.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id

  }

  tags = merge(
    var.info_tags, {
      Name = var.RouteTable[1]
      # RT_Private
  })
}*/

# AWS Route Table Association
# Public Subnet
resource "aws_route_table_association" "association_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rt_public.id
}

# Private Subnet
/*resource "aws_route_table_association" "Private_Subnet" {
  subnet_id      = aws_subnet.Subnet_Private.id
  route_table_id = aws_route_table.RT_Private.id
}*/