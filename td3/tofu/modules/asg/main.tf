provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "sample_app" {
  name        = "${var.name}-sg"
  description = "Allow HTTP traffic into ${var.name}"

  ingress {
    from_port   = var.app_http_port
    to_port     = var.app_http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "sample_app" {
  name          = "${var.name}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)

  network_interfaces {
    security_groups = [aws_security_group.sample_app.id]
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name}-instance"
    }
  }
}

resource "aws_autoscaling_group" "sample_app" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  launch_template {
    id      = aws_launch_template.sample_app.id
    version = "$Latest"
  }

  target_group_arns = var.target_group_arns

  vpc_zone_identifier = var.subnet_ids

  tags = [
    {
      key                 = "Name"
      value               = "${var.name}-asg"
      propagate_at_launch = true
    }
  ]
}
