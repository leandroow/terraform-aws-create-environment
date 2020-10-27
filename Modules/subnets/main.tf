resource "aws_subnet" "public" {
  count = min(length(var.cidr_blocks))
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "var.cidr_block[count.index]"
  availability_zone       = var.availability_zone

  tags = {
    Name = "var.subnet_name[count.index]"
  }
}
