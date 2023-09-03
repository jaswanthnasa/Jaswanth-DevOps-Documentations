## EC2 instance
```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"
    key_name = "dpp"
}
```
<br>

## S3 bucket
```
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "baddjaf-3473" 
    // acl = "${var.acl_value}"  
}
```
