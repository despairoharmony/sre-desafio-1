resource "aws_subnet" "sre_subnet" {
  vpc_id                  = aws_vpc.sre_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"  # Substitua pela zona desejada
  map_public_ip_on_launch = true
  tags = {
    Name = "sre-chlng-1-subnet"
  }
}

resource "aws_route_table" "sre-1-route-table" {
  vpc_id = aws_vpc.sre_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sre-1-gw.id
  }
  tags = {
    Name = "sre-1-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.sre_subnet.id
  route_table_id = aws_route_table.sre-1-route-table.id
}