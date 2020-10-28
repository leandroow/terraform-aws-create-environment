output "public_sg" {
  description = "List of IDs of public SG"
  value       = aws_security_group.sg-public.id
}