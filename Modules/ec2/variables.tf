variable "ami_id" {
    type    = string
    default = "ami-023c8dbf8268fb3ca"
}

variable "instance_type" {
    type    = string
    default = "t3.micro"    
}

variable "availability_zone" {
    type    = string
    default = "us-east-2a"
}

variable "subnet_id_public" {
    type    = string
}

variable "subnet_id_private" {
    type    = string
}

variable "sg_private_id" {

}

variable "sg_public_id" {

}

variable "key" {
    type    = string
}