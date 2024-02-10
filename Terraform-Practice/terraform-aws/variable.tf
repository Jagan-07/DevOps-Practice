# variables for EC2 main file

variable "ec2_ami" {
	default = "ami-0c7217cdde317cfec"
}

variable "ec2_instance_type" {
	default = "t2.micro"
}

variable "ec2_name" {
	default = "terraform-insatance"
}

# variable for S3 buckets

variable "s3_name" {
	default = "terraform-bucket-070"
} 
