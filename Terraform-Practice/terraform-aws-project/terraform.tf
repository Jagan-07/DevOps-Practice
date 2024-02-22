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

# Create AWS-VPC and associte all the other resources
resource "aws_vpc" "main_vpc" {
	cidr_block = "10.0.0.0/16"

	tags = {
		Name = "TF_VPC"
}
}

# Create subnets

# Public subnet
resource "aws_subnet" "public_subnet" {
	vpc_id = aws_vpc.main_vpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "us-east-1a"

	tags = {
		Name = "public-subnet"
}
}

# Private subnet
resource "aws_subnet" "private_subnet" {
        vpc_id = aws_vpc.main_vpc.id
        cidr_block = "10.0.2.0/24"
	availability_zone = "us-east-1b"

        tags = {
                Name = "private-subnet"
}
}

# Create a IGW and attach it to the VPC
resource "aws_internet_gateway" "main_gateway" {
	vpc_id = aws_vpc.main_vpc.id

	tags = {
		Name = "TF_IGW"
}
}

# Create a RT and attach to the public subnet
resource "aws_route_table" "main_route_table" {
	vpc_id = aws_vpc.main_vpc.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.main_gateway.id
}

	tags = {
		Name = "TF_RT"	
}
}

# Create a RT-association between subnet and RT to expose to the internet
resource "aws_route_table_association" "main_association" {
	subnet_id = aws_subnet.public_subnet.id
	route_table_id = aws_route_table.main_route_table.id
}

# Create a EC2 instance in the public subnet
resource "aws_instance" "main_instance" {
	ami = "ami-0557a15b87f6559cf"
	instance_type = "t2.micro"
	key_name = "test"
	vpc_security_group_ids = [aws_security_group.main_sg.id]
	subnet_id = aws_subnet.public_subnet.id
	associate_public_ip_address = true
	user_data = <<-EOF
			#! /bin/bash
			sudo apt-get update
			sudo apt-get install -y apache2
			sudo systemctl start apache2
			sudo systemctl enable apache2
			echo "The page was created by the user data and provisioned using TERRAFORM" | sudo tee /var/www/html/index.html
			EOF
	tags = {
		Name = "TF_SERVER"
}
}

# Create a EIP for EC2 instance
resource "aws_eip" "main_epi" {
	instance = aws_instance.main_instance.id
	domain = "vpc"

	tags = {
		Name = "TF_EIP"
}
}

# Create a security-group
resource "aws_security_group" "main_sg" {
	name = "terraform-sg"
	vpc_id = aws_vpc.main_vpc.id
	
	# Inbound Rule
	ingress {
	cidr_blocks = [
	"0.0.0.0/0"
	]

	from_port = 80
	to_port = 80
	protocol = "tcp"
}

	ingress {
	cidr_blocks = [
	"0.0.0.0/0"
	]

	from_port = 22
	to_port = 22
	protocol = "tcp"
}
	
	# Outbound Rule
	egress {
	cidr_blocks = [
	"0.0.0.0/0"
	]

	from_port = 0
	to_port = 0
	protocol = "-1"
}
}

