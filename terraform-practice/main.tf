provider "aws" {
    region = "${var.region}"
}

module "S3" {
    source = ".//S3"
    #bucket name should be unique
    bucket_name = "mr-78323"       
}