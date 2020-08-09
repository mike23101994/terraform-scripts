
data "aws_s3_bucket" "lb_logs" {
  bucket = "alb-logs-nile"
}

resource "aws_lb" "nile-alb" {
  name               = "nile-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-9bac09c6","subnet-6664af1e"]
  

  enable_deletion_protection = false

  tags = {
    Environment = "Dev"
  }

  depends_on = [aws_security_group.lb_sg]
}


resource "aws_security_group" "lb_sg"{
  vpc_id = data.aws_vpc.default.id

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
   tags = {
        Name = "Nile-ALB-SG2"
    }
}



