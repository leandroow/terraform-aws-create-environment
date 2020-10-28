output "public_subnet" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.create.0.id
}

output "private_subnet" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.create.1.id
}