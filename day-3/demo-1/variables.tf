variable "aws_region" {
   description = "AWS region to deploy resources"
   default 	= "us-east-1"
 }
variable "instance_type" {
   description = "EC2 instance type"
   default 	= "t2.small"
 }
variable "ami_id" {
   description = "Amazon Linux 2 AMI ID"
   default 	= "ami-0c02fb55956c7d316"
 }
