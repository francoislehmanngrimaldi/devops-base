variable "ami_id" {
description = "The ID of the AMI to run."
type = string
}
variable "name" {
description = "The base name for the instance and all other resources"
type = string
}
variable "instance_count" {
  description = "Number of instances to deploy"
  type        = number
  default     = 1
}
variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "port" {
  description = "Port to allow inbound traffic"
  type        = number
  default     = 8080
}
