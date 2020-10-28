resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  vpc_security_group_ids = [var.sg_public_id]
  subnet_id = var.subnet_id_public
  key_name = var.key

  tags = {
    Name = "webserver"
  }
}

resource "aws_instance" "database" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  vpc_security_group_ids = [var.sg_private_id]
  subnet_id = var.subnet_id_private
  key_name = var.key

  tags = {
    Name = "database"
  }
}