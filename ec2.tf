provider "aws" {
    region = "us-east-1"
    access_key = "AKIAXHMDY4XR5QUSU6JQ"
    secret_key = "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"
}

resource "aws_instance" "ec2" {
  ami = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"
}