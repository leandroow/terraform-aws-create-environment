resource "aws_subnet" "create" {
  count = min(length(var.cidr_block))
  vpc_id                   = var.vpcid
  cidr_block              = var.cidr_block[count.index]
  availability_zone        = var.availability_zone

  tags = {
    Name = "var.subnet_name[count.index]"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = var.vpcid
tags = {
    Name = "gateway"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = var.vpcid
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
tags = {
    Name = "awslab-rt-internet"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.create.0.id
  route_table_id = aws_route_table.route-table.id
}