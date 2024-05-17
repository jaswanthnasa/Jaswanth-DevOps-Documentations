provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "ec2_demo" {
    ami = var.ami
    instance_type = var.instance_type
      tags = {
      Name = local.instance_name
    }

  
}
