provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSecurityGroup"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0a716d3f3b16d290c" # Amazon Linux 2
  instance_type = "t3.micro"
  key_name      = "new-keyy" # replace with your key pair name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  provisioner "file" {
    source      = "index.html"
    destination = "/home/ubuntu/terraform/day-4/demo-2/index.html"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo 'hello'"
  #   ]
  # }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/tmp/new-keyy.pem") # update path to your PEM
    host        = self.public_ip
  }

  tags = {
    Name = "FileProvisionerDemo"
  }
}

