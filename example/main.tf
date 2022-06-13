resource "aws_instance" "web" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = aws_instance.web.id
}


terraform {
  backend "s3" {
    bucket = "harness-mainak"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}
