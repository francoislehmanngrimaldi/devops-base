

output "security_group_id" {
  description = "The ID of the security group"
  value = aws_security_group.sample_app[0].id  # Accéder au groupe de sécurité de la première instance
}


