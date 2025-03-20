data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "^myami-[0-9]{3}"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-*-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = "x86_64"
  }
}