provider "aws" {
   region = "us-east-1"
 }
# 1. Create VPC
 resource "aws_vpc" "day4_vpc" {
   cidr_block = "10.0.0.0/16"
   tags = {
 	Name = "Day4-VPC"
   }
 }
# 2. Create Subnet
 resource "aws_subnet" "day4_subnet" {
   vpc_id              	= aws_vpc.day4_vpc.id
   cidr_block          	= "10.0.1.0/24"
   availability_zone   	= "us-east-1a"
   map_public_ip_on_launch = true
   tags = {
 	Name = "Day4-Subnet"
   }
 }
# 3. Create Internet Gateway
 resource "aws_internet_gateway" "day4_igw" {
   vpc_id = aws_vpc.day4_vpc.id
   tags = {
 	Name = "Day4-IGW"
   }
 }
# 4. Create Route Table
 resource "aws_route_table" "day4_rt" {
   vpc_id = aws_vpc.day4_vpc.id
   tags = {
 	Name = "Day4-RouteTable"
   }
 }
# 5. Add Route to Internet
 resource "aws_route" "day4_internet_route" {
   route_table_id     	= aws_route_table.day4_rt.id
   destination_cidr_block = "0.0.0.0/0"
   gateway_id         	= aws_internet_gateway.day4_igw.id
 }
# 6. Associate Route Table with Subnet
 resource "aws_route_table_association" "day4_rt_assoc" {
   subnet_id  	= aws_subnet.day4_subnet.id
   route_table_id = aws_route_table.day4_rt.id
 }
# 7. Create Security Group
 resource "aws_security_group" "day4_sg" {
   vpc_id = aws_vpc.day4_vpc.id
   name   = "day4-sg"
ingress {
 	from_port   = 22
 	to_port 	= 22
 	protocol	= "tcp"
 	cidr_blocks = ["0.0.0.0/0"]
   }
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
tags = {
 	Name = "Day4-SG"
   }
 }
# 8. Launch EC2 Instance
 resource "aws_instance" "day4_instance" {
   ami                     	= "ami-0c02fb55956c7d316" # Amazon Linux 2
   instance_type           	= "t3.micro"
   subnet_id               	= aws_subnet.day4_subnet.id
   vpc_security_group_ids  	= [aws_security_group.day4_sg.id]
   associate_public_ip_address = true
tags = {
 	Name = "Day4-EC2"
   }
 }
