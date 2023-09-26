resource "aws_internet_gateway" "sre-1-gw" {
  vpc_id = aws_vpc.sre_vpc.id
  tags = {
    Name = "sre-1-gw"
  }
}
