output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sample_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = aws_subnet.sample_subnet[*].id
}
