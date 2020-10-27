resource "aws_instance" "webserver" {
  ami           = "var.ami_id"
  instance_type = "var.instance_type"
  availability_zone = "var.availability_zone"
  vpc_security_group_ids = aws_security_group.sg-public.id
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "webserver"
  }
}

resource "aws_instance" "database" {
  ami           = "var.ami_id"
  instance_type = "var.instance_type"
  availability_zone = "var.availability_zone"
  vpc_security_group_ids = aws_security_group.sg-private.id
  subnet_id = aws_subnet.private.id

  tags = {
    Name = "database"
  }
}