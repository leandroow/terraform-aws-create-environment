output "private_sg" {
  description = "List of IDs of private SG"
  value       = aws_security_group.sg-private.*.id
}