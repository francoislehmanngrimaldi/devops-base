variable "name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for instances"
  type        = string
}

variable "user_data" {
  description = "User data to configure instances"
  type        = string
}

variable "app_http_port" {
  description = "HTTP port for the application"
  type        = number
}

variable "instance_type" {
  description = "Type of instance to use"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
}
variable "instance_count" {
  description = "Number of instances to deploy"
  type        = number
  default     = 1
}


variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
}
