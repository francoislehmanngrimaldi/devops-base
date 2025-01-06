variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "alb_http_port" {
  description = "Port on which the ALB will listen"
  type        = number
}

variable "app_http_port" {
  description = "Port of the application running on the EC2 instances"
  type        = number
}

variable "app_health_check_path" {
  description = "Path for the ALB health check"
  type        = string
}
variable "security_group_id" {
  description = "The ID of the security group for the ALB"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
}
