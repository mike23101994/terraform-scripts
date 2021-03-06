

variable "aws_region" {
	default = "us-east-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "public_subnets_cidr" {
	default = "10.20.1.0/24"
}


variable "private_subnets_cidr" {
	default =  "10.20.2.0/24"
}

variable "public_azs" {
	default = "us-east-1a"
}

variable "private_azs" {
	default = "us-east-1b"
}
