output "ASG_ID" {
    description="ID of auto scaling group"
     value = aws_autoscaling_group.ASG.id
}

output "ASG_name" {
    description="name of auto scaling group"
     value = aws_autoscaling_group.ASG.name
}