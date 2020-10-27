resource "aws_vpc" "main" {
  cidr_block       = "var.cidr_block"
  instance_tenancy = "default"

  tags = {
    Name = "awslab-vpc"
  }
}