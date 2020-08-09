data "aws_instance" "nile-instance" {
  instance_id = var.instance_id
  }

data "aws_vpc" "default" {
  id = var.vpc_id
}


resource "aws_lb_listener" "nile-listener2" {
  load_balancer_arn = aws_lb.nile-alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.niletargetgroup2.arn
  }
}

resource "aws_lb_target_group" "niletargetgroup2" {
  name     = "Nile-Target-Group2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path = "/"
    port = 2001
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  
  }
}


resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.niletargetgroup2.arn
  target_id        = data.aws_instance.nile-instance.id
  port             = 80
}

