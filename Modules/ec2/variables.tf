variable "ami_id" {
    type    = string
    default = ["ami-023c8dbf8268fb3ca"]
}

variable "instance_type" {
    type    = string
    default = ["t3.micro"]    
}

variable "availability_zone" {
    type    = string
    default = ["us-east-2a"]
}
