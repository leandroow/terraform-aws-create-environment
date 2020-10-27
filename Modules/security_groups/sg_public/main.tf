resource "aws_security_group" "sg-public" {
  vpc_id       = aws_vpc.main.id
  name         = "var.sg_name"
  description  = "var.sg_description"
  
  #allow ingress on defined ports
  "ingress" {
    count = min(length(var.ingress_ports))
    from_port         = var.ingress_rules[count.index][0]
    to_port           = var.ingress_rules[count.index][1]
    protocol          = var.ingress_rules[count.index][2]
    cidr_blocks       = var.ingress_rules[count.index][3]
    description       = var.ingress_rules[count.index][4]
    }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }tags = {
   Name = "private_sg"
   Description = ""
  }
}