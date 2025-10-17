provider "aws" {
   region = "us-east-1"
 }
resource "aws_instance" "my_first_ec2" {
   ami       	= "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
   instance_type = "t3.micro"
tags = {
 	Name = "TerraformDay1Instance"
   }
 }

