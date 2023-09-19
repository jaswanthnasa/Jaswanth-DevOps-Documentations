provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo-inst" {
  ami = var.ami_id_value
  instance_type = var.instance_type_value
  tags = {
    Name = var.Name_value
  }
  key_name = var.key_name_value
  
}