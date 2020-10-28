resource "aws_security_group" "sg-private" {
  vpc_id      = var.vpcid
  name        = var.sg_name
  description = var.sg_description
}

resource "aws_security_group_rule" "ingress_rules" {
  count       = min(length(var.ingress_rules))
  type              = "ingress"
  from_port   = var.ingress_rules[count.index].from_port
  to_port     = var.ingress_rules[count.index].to_port
  protocol    = var.ingress_rules[count.index].protocol
  cidr_blocks = [var.ingress_rules[count.index].cidr_block]
  description = var.ingress_rules[count.index].description
  security_group_id = aws_security_group.sg-private.id
  }

resource "aws_security_group_rule" "egress_rule" {
  type = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-private.id
}