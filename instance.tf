resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.ami2.id 
  instance_type = var.instance_type
  user_data = file("/root/app1-install.sh")
  key_name = var.aws_key
  vpc_security_group_ids = [aws_security_group.ssh_web.id]  
  tags = {
    "Name" = "EC2 Demo 2"
  }
}