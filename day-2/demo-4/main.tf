resource "aws_security_group" "custom_sg" {
   name    	= "custom-sg"
   description = "Allow custom port"
ingress {
 	from_port   = 8080
 	to_port 	= 8080
 	protocol	= "tcp"
 	cidr_blocks = ["0.0.0.0/0"]
   }
egress {
 	from_port   = 0
 	to_port 	= 0
 	protocol	= "-1"
 	cidr_blocks = ["0.0.0.0/0"]
   }
tags = {
 	Name = "Demo2-CustomSG"
   }
 }
