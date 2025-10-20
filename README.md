🚀 Terraform Complete Guide for Beginners to Advanced

📘 A step-by-step learning repository to master Terraform with real-world examples.

📌 What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp that enables you to define and provision infrastructure using configuration files.

🔥 Why Use Terraform?

✅ Automate Cloud Infrastructure

✅ Version Controlled & Repeatable Deployments

✅ Works Across AWS, Azure, GCP

✅ Declarative & Scalable

🛠️ Prerequisites
Requirement	Description
Cloud Account	AWS / Azure / GCP
AWS CLI	For Cloud Authentication
Terraform CLI	Main IaC Tool
IAM User	Programmatic Access
📥 Installation Guide
<details> <summary><b>🔹 Install Terraform on Ubuntu</b></summary>
sudo apt update && sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform
terraform -version

</details> <details> <summary><b>🔹 Install AWS CLI</b></summary>
sudo apt install awscli -y
aws --version

</details> <details> <summary><b>🔹 Configure AWS</b></summary>
aws configure


Enter the following:

AWS Access Key

AWS Secret Access Key

Default Region (e.g., ap-south-1)

Output Format (json)

</details>
📂 Repository Structure
terraform/
├── Day-1       # Basics & Provider Setup
├── Day-2       # Multiple Terraform demos
├── Day-3       # Variables, Outputs, tfvars
├── Day-4       # Modules & Advanced Config
├── Day-5       # Real-world deployment (S3 + static hosting)
└── README.md


✨ Each folder contains practical .tf files to help you learn step-by-step.

⚙️ Terraform Basic Commands
terraform init      # Initialize working directory
terraform plan      # Preview changes
terraform apply     # Create/modify infrastructure
terraform destroy   # Delete all resources

📁 Example: AWS EC2 Resource
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
}

🎯 Variables & Outputs Example
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

🗃️ Terraform State Management

terraform.tfstate → Tracks actual infrastructure.

terraform.tfstate.backup → Auto-backup of last state.

🚫 Never commit state files! Add them to .gitignore.

🧠 Best Practices

✔ Use variables for reusability
✔ Organize code using modules
✔ Always review using terraform plan
✔ Use remote backend (S3 + DynamoDB) for production
✔ Use Git for version control

📚 Topics Covered
Day	Topics	Key Concepts
Day-1	Basics	Provider, Resource, Init
Day-2	Multiple Examples	EC2, S3, State Files
Day-3	Variables & Outputs	Reusability, tfvars
Day-4	Modules	Modular Infrastructure
Day-5	Deployment	S3 Static Website Hosting
🏁 Conclusion

By completing this repository, you will:

✅ Build Infrastructure using Terraform
✅ Manage State & Variables Professionally
✅ Deploy Cloud Resources End-to-End
✅ Follow Production Best Practices

📞 Need Support?

Feel free to raise an issue or reach out —
Happy Terraforming! 🚀
