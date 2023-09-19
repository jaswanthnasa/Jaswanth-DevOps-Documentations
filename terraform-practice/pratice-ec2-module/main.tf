provider "aws" {
  region = "ap-south-1"
}

module "xyz" {
    source = "./modules/ec2-instance"
    ami_id_value = "ami-05552d2dcf89c9b24"
    instance_type_value = "t2.micro"
    key_name_value = "mykeypair"
    Name_value = "boomba-instace"
  
}