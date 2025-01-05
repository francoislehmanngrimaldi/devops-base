output "instance_id" {
  description = "The ID of the EC2 instance"
  value = aws_instance.sample_app[0].id  # Accéder à la première instance
}

output "security_group_id" {
  description = "The ID of the security group"
  value = aws_security_group.sample_app[0].id  # Accéder au groupe de sécurité de la première instance
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value = aws_instance.sample_app[0].public_ip  # Accéder à l'IP publique de la première instance
}
