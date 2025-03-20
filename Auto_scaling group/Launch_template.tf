resource "aws_launch_template" "asg_template" {
  name = "asg_template"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 5
    }
  }
     default_version = 1
  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_stop        = true
  disable_api_termination = true

  ebs_optimized = true

  image_id = data.aws_ami.ami.id

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type
  key_name = var.instance_key


  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

 /* network_interfaces {
    associate_public_ip_address = true
    
  }*/

  vpc_security_group_ids = [aws_security_group.alb-sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-template"
    }
  }

  user_data = filebase64("app_install.sh")
}

output "launch_template_id" {
    description = "ID of Launch template"
    value = aws_launch_template.asg_template
  
}