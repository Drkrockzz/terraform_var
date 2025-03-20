resource "aws_autoscaling_group" "ASG" {
  depends_on = [ aws_vpc.vpc, aws_security_group.alb-sg ]
  name = "ALB-ASG"
  //availability_zones = [var.firstpublic_az, var.secondpublic_az]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2
  target_group_arns = [aws_lb_target_group.albtg-asg.arn]
# subnet to launch instance 
   vpc_zone_identifier = [aws_subnet.public_subnet-1a.id, aws_subnet.public_subnet-1c.id]

  launch_template {
    id      = aws_launch_template.asg_template.id
    version = aws_launch_template.asg_template.latest_version
  }

  tag {
    key                 = "ASGTEST"
    value               = "Test"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}

resource "aws_autoscaling_policy" "cpu_policy" {
  autoscaling_group_name = aws_autoscaling_group.ASG.name
  name                   = "CPU-Policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 10
  }
}