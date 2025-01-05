variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # AMI Amazon Linux
  instance_type = var.instance_type
}
