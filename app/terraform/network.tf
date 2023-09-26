resource "aws_vpc" "sre_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "sre-chlng-1-vpc"
  }
}

resource "aws_eip" "sre-1-ip" {
  instance = aws_instance.app_server.id
}
