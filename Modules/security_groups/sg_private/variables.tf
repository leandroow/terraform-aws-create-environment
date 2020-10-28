variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = ""
      cidr_block  = ""
      description = ""
  }, ]
}
variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "vpcid" {
    type = string
}
