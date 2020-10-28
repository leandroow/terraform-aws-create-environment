provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "172.16.0.0/16"
}

module "subnets" {
  source            = "./modules/subnets"
  subnet_name       = ["awslab-subnet-public", "awslab-subnet-private"]
  cidr_block        = ["172.16.1.0/24", "172.16.2.0/24"]
  availability_zone = "us-east-2a"
  vpcid             = module.vpc.vpc_id
}

module "security_group_public" {
  source = "./modules/security_groups/sg_public"
  vpcid  = module.vpc.vpc_id
  sg_description = "publicSG"
  sg_name = "SG-PUBLIC"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "securitygroup"
    },
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "icmp"
      cidr_block  = "0.0.0.0/0"
      description = "securitygroup"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "securitygroup"
    },
  ]
}

module "security_group_private" {
  source = "./modules/security_groups/sg_private"
  vpcid  = module.vpc.vpc_id
  sg_description = "publicSG"
  sg_name = "SG-PUBLIC"

  ingress_rules = [
    {
      from_port   = 3110
      to_port     = 3110
      protocol    = "tcp"
      cidr_block  = "172.16.1.0/24"
      description = "securitygroup"
    },
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "icmp"
      cidr_block  = "0.0.0.0/0"
      description = "securitygroup"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = "172.16.1.0/24"
      description = "securitygroup"
    },
  ]
}

module "instances" {
  source            = "./modules/ec2"
  ami_id            = "ami-023c8dbf8268fb3ca"
  instance_type     = "t3.micro"
  availability_zone = "us-east-2a"
  subnet_id_public  = module.subnets.public_subnet
  subnet_id_private = module.subnets.private_subnet
  sg_private_id     = module.security_group_private.private_sg
  sg_public_id      = module.security_group_public.public_sg
  key               = "cocus"
}


