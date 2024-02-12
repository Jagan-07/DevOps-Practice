# Creating EC2 using FOR_EACH-MAP META ARG

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
	instances = {"Amazon-instance":"ami-0e731c8a588258d0d","Ubuntu-instance":"ami-0c7217cdde317cfec","RedHat-instance":"ami-0fe630eb857a6ec83"}
}

resource "aws_instance" "ec2_resource" {
	for_each = local.instances
	ami = each.value                        # Where values are ami's in instances attribute     
	instance_type = "t2.micro"
	tags = {
		Name = each.key  		# Where keys are names in instances attribute
}
}

