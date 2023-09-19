provider "aws" {
  region = var.region_value
}

resource "aws_instance" "instance_1" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    key_name = "mykeypair"
    tags = {
      Name = var.name
    }
  
}