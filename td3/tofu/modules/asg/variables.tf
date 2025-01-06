variable "name" {
  description = "The name prefix for resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the instances"
  type        = string
}

variable "user_data" {
  description = "User data to initialize the instances"
  type        = string
}

variable "app_http_port" {
  description = "The HTTP port on which the app listens"
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "The desired number of instances in the ASG"
  type        = number
}

variable "subnet_ids" {
  description = "The list of subnet IDs where instances will be launched"
  type        = list(string)
}

variable "target_group_arns" {
  description = "A list of target group ARNs to associate with the ASG"
  type        = list(string)
}
