provider "aws" {
   region = "us-east-1"
 }
# Security Group
 resource "aws_security_group" "web_sg" {
   name    	= "web-sg"
   description = "Allow SSH and HTTP traffic"
ingress {
 	description = "SSH"
 	from_port   = 22
 	to_port 	= 22
 	protocol	= "tcp"
 	cidr_blocks = ["0.0.0.0/0"]
   }
ingress {
 	description = "HTTP"
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
tags = {
 	Name = "Day2SecurityGroup"
   }
 }
# EC2 Instance with Security Group
 resource "aws_instance" "web_instance" {
   ami       	= "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
   instance_type = "t3.micro"
   vpc_security_group_ids = [aws_security_group.web_sg.id]
tags = {
 	Name = "TerraformDay2Instance"
   }
 }
