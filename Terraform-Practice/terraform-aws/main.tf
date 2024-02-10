# Main tf file to provision EC2 and S3 in AWS
# Terraform configuration
terraform {
	required_providers {
		aws = {
		source = "hashicorp/aws"
		version = "~> 5.0"
}
}
}

# Provider Configuration
provider "aws" {
	region = "us-east-1"
}

# resource to create EC2
resource "aws_instance" "ec2_resource" {
	ami = var.ec2_ami
	instance_type = var.ec2_instance_type
	tags = {
		Name = var.ec2_name
}
}

# resource to create S3
resource "aws_s3_bucket" "s3_resource" {
	bucket = var.s3_name
	tags = {
		Name = var.s3_name
		Environment = "Dev"
}
}

