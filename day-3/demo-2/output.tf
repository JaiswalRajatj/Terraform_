output "instance_id" {
   value = aws_instance.tfvars_demo.id
 }
output "instance_type" {
   value = aws_instance.tfvars_demo.instance_type
 }
output "region" {
   value = var.aws_region
 }

