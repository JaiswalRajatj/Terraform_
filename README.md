🚀 Terraform Complete Guide for Beginners to Advanced

Welcome to the Terraform Learning Repository!
This repository is designed to take you from zero to deployment-ready with hands-on examples, organized day-wise from basics to advanced cloud automation.

📌 What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp that allows you to define and provision infrastructure using declarative configuration files.

✅ Automate Cloud Infrastructure
✅ Version Controlled Infrastructure
✅ Multi-Cloud Support (AWS, Azure, GCP)
✅ Scalable & Repeatable Deployments

🛠️ Prerequisites
Requirement	Description
Cloud Account	AWS / Azure / GCP
AWS CLI	To authenticate AWS
Terraform CLI	For executing IaC code
IAM User	Programmatic Access
📥 Installation Guide
🔹 Install Terraform on Ubuntu
sudo apt update && sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform
terraform -version

🔹 Install AWS CLI
sudo apt install awscli -y
aws --version

🔹 Configure AWS
aws configure


Enter your:

AWS Access Key

Secret Key

Region (e.g., ap-south-1)

Output Format (json)

📂 Repository Structure
terraform/
├── Day-1       # Basics & Provider Setup
├── Day-2       # Multiple Terraform demos
├── Day-3       # Variables, Outputs, tfvars
├── Day-4       # Modules & Advanced Config
├── Day-5       # Real-world deployment (S3 + static hosting)
└── README.md


Each folder contains main.tf, state files, and additional configuration files to help you learn step by step.

⚙️ Terraform Basic Workflow
terraform init      # Initialize directory with plugins and providers
terraform plan      # Preview the resources before creation
terraform apply     # Create infrastructure
terraform destroy   # Delete infrastructure

📁 Example main.tf (AWS EC2 Demo)
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
}

📌 Variables & Outputs Example
variables.tf
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

outputs.tf
output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}

terraform.tfvars
instance_type = "t2.small"

📊 Terraform State Management

Terraform maintains the state of resources using:

terraform.tfstate – Tracks real infrastructure

terraform.tfstate.backup – Automatically created backup

Always commit .tf files, never commit state files (use .gitignore)

🧠 Best Practices

✅ Use variables for dynamic configs
✅ Use modules for reusable infrastructure
✅ Always run terraform plan before apply
✅ Enable remote state using S3 + DynamoDB for production
✅ Use version control (Git)

🚀 Topics Covered Day-wise
Day	Topics	Key Concepts
Day-1	Basics	Provider, Resource, Initialization
Day-2	Multiple Examples	EC2, S3 setups, state handling
Day-3	Variables & Outputs	Reusability, tfvars, environment separation
Day-4	Modules	Modular infrastructure
Day-5	Real Deployment	S3 static website hosting
🔚 Conclusion

By the end of this repository, you will be able to:

✅ Build infrastructure using Terraform
✅ Use variables, state files, and modules
✅ Deploy real-world applications on cloud
✅ Follow production-grade best practices

📞 Need Help?

If you have any questions, feel free to connect or raise an issue in this repo!
Happy Terraforming! 🚀
