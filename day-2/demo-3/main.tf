provider "aws" {
   region = "us-east-1"
 }
resource "aws_key_pair" "demo_key" {
   key_name   = "new-keyy-1"
   public_key = file("/tmp/new-keyy-1.pub") # must exist locally
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
resource "aws_instance" "ssh_instance" {
   ami       	= "ami-0c02fb55956c7d316"
   instance_type = "t3.micro"
   key_name  	= aws_key_pair.demo_key.key_name
   vpc_security_group_ids = [aws_security_group.ssh_sg.id]
tags = {
 	Name = "Demo2-SSHInstance"
   }
 }
