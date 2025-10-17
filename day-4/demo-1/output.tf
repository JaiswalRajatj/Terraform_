output "ec2_public_ip" {
   description = "Public IP of EC2"
   value   	= aws_instance.day4_instance.public_ip
 }
output "vpc_id" {
   description = "VPC ID"
   value   	= aws_vpc.day4_vpc.id
 }
