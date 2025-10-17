provider "aws" {
   region = "us-east-1"
 }
resource "aws_security_group" "ssh_sg" {
   name    	= "ssh-sg"
   description = "Allow SSH"
   ingress {
 	from_port   = 22
 	to_port 	= 22
 	protocol	= "tcp"
 	cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
 	from_port   = 0
 	to_port 	= 0
 	protocol	= "-1"
 	cidr_blocks = ["0.0.0.0/0"]
   }
 }
resource "aws_security_group" "http_sg" {
   name    	= "http-sg"
   description = "Allow HTTP"
   ingress {
 	from_port   = 80
 	to_port 	= 80
 	protocol	= "tcp"
 	cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
 	from_port   = 0
 	to_port 	= 0
 	protocol	= "-1"
 	cidr_blocks = ["0.0.0.0/0"]
   }
 }
resource "aws_instance" "multi_sg_instance" {
   ami       	= "ami-0c02fb55956c7d316"
   instance_type = "t3.micro"
   vpc_security_group_ids = [
     aws_security_group.ssh_sg.id,
 	aws_security_group.http_sg.id
   ]
tags = {
 	Name = "Demo2-MultiSG"
   }
 }
