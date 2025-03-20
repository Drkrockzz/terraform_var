variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "instance_key" {
  description = "Key for the instance"
  type = string
  default = "virginia_linuxkey"
}