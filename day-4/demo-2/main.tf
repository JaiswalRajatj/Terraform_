provider "aws" {
   region = "us-east-1"
 }
resource "aws_instance" "web" {
   ami       	= "ami-0c02fb55956c7d316" # Amazon Linux 2
   instance_type = "t3.micro"
   key_name  	= "new-keyy" # replace with your key pair name
provisioner "file" {
 	source  	= "index.html"
 	destination = "/home/ubuntu/terraform/day-4/demo-2/index.html"
   }
#provisioner "remote-exec" {
 # inline = [
  #  "echo'helllo'"
 #]
#}
connection {
 	type    	= "ssh"
 	user    	= "ec2-user"
 	private_key = file("/tmp/new-keyy.pem") # update path to your PEM/PPK
 	host    	= self.public_ip
   }
tags = {
 	Name = "FileProvisionerDemo"
   }
 }
