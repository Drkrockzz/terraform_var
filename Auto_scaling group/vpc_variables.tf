variable "firstpublic_subnet" {
    description = "Public subnet of VPC aws_vpc.vpc.name}"
    default = "60.0.1.0/24"
}

variable "secondpublic_subnet" {
    description = "Public subnet of VPC aws_vpc.vpc.name}"
    default = "60.0.10.0/24"
}

variable vpc_tags {
    description = "Tags for vpc resoures creted"
    type = map(string)
    default = {
            name = "ASG Resources"
}
}

variable "firstpublic_az" {
    description = "AZ of public subnet"
    type = string
    default = "us-east-1a"
  
}

variable "secondpublic_az" {
    description = "AZ of public subnet"
    type = string
    default = "us-east-1c"
}