 provider "aws" {
   profile = var.profile
   region = var.region
}

resource "aws_instance" "nile-ec2" {
    ami           = "ami-02354e95b39ca8dec"
    instance_type = "t2.micro"
    key_name = aws_key_pair.nile-key.key_name
}

resource "aws_key_pair" "nile-key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAn8D7Nkhyc7qZ0mZ7lIO236gB0KcPzLYrmBg6T8UXWUDkLW4j/HQYBf6jIdtkd5QJ+F5Z53H8tQ/dv3F+QmSTHkBV6IASY+ugWGVCN7XImjxuiSgBxZ70MzK4TNcx7j/finVMFptl2qdWeZyvUtWYldFMgqlGmXDBtEydt8g6tqkX1Saq0YmMU7uXE6TRJHPFoGsyLbBbiVjDIx9YPdVpgjs7ZyRSQ2BNQEb6NaSsVOvW5R1+ceBITLX9n7tmzE0jJ4tnl1zR/m2/fiWWkdPT/jWeanlEXlAQR2cU09XjFfdRPVfUDTtE2r9mPk8tcJpJ+LhShpB9Rzwd4jnAAYZEYQ== rsa-key-20200812"
}

