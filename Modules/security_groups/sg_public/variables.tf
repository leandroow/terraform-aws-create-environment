variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = []
    
variable "sg_name" {
    type    = string
    default = ["SG-public"]
}

variable "sg_description" {
    type    = string
    default = ["SG for public access"]
}
