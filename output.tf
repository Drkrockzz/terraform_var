// output from for loop with list type of variable
output "for_from_list" {
    description = "Value from list of instance"
    value = [ for x in aws_instance.myec2vm: instance.public_dns] 
}

output "for_from_map_variable" {
    description = "value from map variable of instance"
    value = { for x in aws_instance.myec2vm: instance.id => instance.public_dns}  
}

output "splat_operator" {
    description = "output using splat" 
    value = aws_instance.myec2vm[*].public_dns
}