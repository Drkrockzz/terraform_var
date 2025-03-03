variable "aws_region" {
  description = "Region in whch we want to provisiob resource"
  type      = string
  default = "us-east-1"
}

variable "aws_key" {
  type      = string
  default = "virginia_linuxkey"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}