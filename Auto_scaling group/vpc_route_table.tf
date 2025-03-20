#Interner Gateway
resource "aws_internet_gateway" "sgw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.vpc_tags
}

#Route Table
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sgw.id
  }

   route {
    cidr_block = "60.0.0.0/16"
    gateway_id = "local"
  }

  tags = var.vpc_tags
}

#subnet route table association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet-1a.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet-1c.id
  route_table_id = aws_route_table.rt1.id
}