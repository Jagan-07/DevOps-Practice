terraform {
	required_providers {
	aws = {
	source = "hashicorp/aws"
	version = "~> 5.0"
}
}
backend "s3" {
	bucket = "remote-backend-bucket07"
	dynamodb_table = "state-locking-table"
	region = "us-east-1"				
	key = "terraform.tfstate"     			# Filename as saved in s3
}
}
