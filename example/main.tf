resource "aws_instance" "web" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

provider "aws" {
    region = "us-east-1"
}