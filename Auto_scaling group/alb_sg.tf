resource "aws_security_group" "alb-sg" {
  vpc_id = aws_vpc.vpc.id

  ingress  {
    cidr_blocks = ["0.0.0.0/0"]
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }
  
  ingress  {
    cidr_blocks = ["0.0.0.0/0"]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }


  egress  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}