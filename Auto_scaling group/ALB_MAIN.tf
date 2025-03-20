
#creating ALB
resource "aws_lb" "ALB-ASG" {
  name               = "alb-asg"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.public_subnet-1a.id, aws_subnet.public_subnet-1c.id ]

  enable_deletion_protection = false

  tags = {
    Environment = "Test"
  }
}

#Creating target group
resource "aws_lb_target_group" "albtg-asg" {
  name        = "alb-tg-asg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    protocol = "HTTP"
    path = "/app1/index.html"
    port = "traffic-port"
    healthy_threshold = "2"
  }
  tags = {
    name = "ASG-TG"
  }
}

#creating listners

resource "aws_lb_listener" "HTTP-listner" {
  load_balancer_arn =  aws_lb.ALB-ASG.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

#creating listner rules

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.HTTP-listner.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.albtg-asg.arn
  }

  condition {
    path_pattern {
      values = ["/app1*"]
    }
  }
}
