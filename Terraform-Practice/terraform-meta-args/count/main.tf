# creating EC2 using COUNT META ARG

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

resource "aws_instance" "ec2_resource" {
	count = 4 # This one of the META ARG used to scale or replicate the instance
	ami = "ami-0c7217cdde317cfec"
	instance_type = "t2.micro"
	tags = {
		Name = "terraform-test-instance-${count.index}" # This ${count.index} is used to access count variable and their index are added to the names
}
}

