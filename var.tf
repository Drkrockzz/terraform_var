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

variable "instance_type_list" {
  description = "List of instance type to select"
  type = list(string)
  default = [ "t3.micro", "t3.small" ] 
}

  variable "instance_type_map" {
    description = "Map of instance type to select"
    type = map(string)
    default = {
      "staging" = "t3.micro"
      "pre-prod" = "t3.small"
      "prod" = "t3.large"
    }    
  }

  



