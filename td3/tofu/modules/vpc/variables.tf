variable "name" {
  description = "The name prefix for resources"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}
