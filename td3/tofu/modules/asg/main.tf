provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "sample_app" {
  name        = "${var.name}-${count.index + 1}"
  description = "Allow HTTP traffic into ${var.name}"
  count       = var.instance_count
}

resource "aws_security_group_rule" "allow_http_inbound" {
  security_group_id = aws_security_group.sample_app[0].id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"  # Ajout de l'argument type
}
resource "aws_instance" "sample_app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "${var.name}-${count.index + 1}"
  }
}

