resource "aws_vpc" "vpc" {
  cidr_block       = "60.0.0.0/16"
  instance_tenancy = "default"

   tags = var.vpc_tags
}

#creating public subnet

resource "aws_subnet" "public_subnet-1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.firstpublic_subnet
  availability_zone = var.firstpublic_az
  map_public_ip_on_launch = true
  tags = var.vpc_tags
}


resource "aws_subnet" "public_subnet-1c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.secondpublic_subnet
  availability_zone = var.secondpublic_az
  map_public_ip_on_launch = true
  tags = var.vpc_tags
}