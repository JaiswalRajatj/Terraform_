variable "aws_region" {
   description = "AWS region to deploy"
   default 	= "us-east-1"
 }
variable "instance_type" {
   description = "EC2 instance type"
   default 	= "t3.micro"
 }
variable "ami_id" {
   description = "Amazon Linux 2 AMI"
   default 	= "ami-0c02fb55956c7d316"
 }
