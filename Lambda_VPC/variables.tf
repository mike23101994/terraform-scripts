
variable "region" {
  default = "us-east-1"
}

variable "lambda_function_handler" {
  default = "welcome.hello"
}

variable "lambda_runtime" {
  default = "python3.7"
}

variable "subnet_ids" {
  default = "subnet-08acf47b4152a2407"
}

variable "security_group_ids" {
  default = "sg-0b0cf0ad734d637b4"
}

