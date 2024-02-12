# Creating EC2 using FOR_EACH-TOSET META ARG

terraform {
	required_providers {
		aws = {
		source = "hashicorp/aws"
		version = "~> 5.0"
}
}
}
provider "aws" {
	region = "us-east-1"

}

locals {
	names = toset(["Alpha-instance","Beta-instance","Gamma-instance"])
}

resource "aws_instance" "ec2_resource" {
	for_each = local.names
	ami = "ami-0e731c8a588258d0d"
	instance_type = "t2.micro"
	tags = {
		Name = each.key  # This each.key is a value of names attribute in locals variable
}
}
