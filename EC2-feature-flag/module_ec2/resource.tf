resource "aws_security_group" "sg"{
  vpc_id = var.vpc_id

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
        Name = var.tag_name
    }
}

resource "aws_key_pair" "nile-key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAn8D7Nkhyc7qZ0mZ7lIO236gB0KcPzLYrmBg6T8UXWUDkLW4j/HQYBf6jIdtkd5QJ+F5Z53H8tQ/dv3F+QmSTHkBV6IASY+ugWGVCN7XImjxuiSgBxZ70MzK4TNcx7j/finVMFptl2qdWeZyvUtWYldFMgqlGmXDBtEydt8g6tqkX1Saq0YmMU7uXE6TRJHPFoGsyLbBbiVjDIx9YPdVpgjs7ZyRSQ2BNQEb6NaSsVOvW5R1+ceBITLX9n7tmzE0jJ4tnl1zR/m2/fiWWkdPT/jWeanlEXlAQR2cU09XjFfdRPVfUDTtE2r9mPk8tcJpJ+LhShpB9Rzwd4jnAAYZEYQ== rsa-key-20200812"
}


resource "aws_placement_group" "ec2-placement_strategy" {
    name    = "EC2_placement_group"
    strategy    = var.placement_group
}
