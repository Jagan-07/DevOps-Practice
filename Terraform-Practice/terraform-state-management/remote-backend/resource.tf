# S3 is created for REMOTE-BACKEND
resource "aws_s3_bucket" "s3_resource" {
	bucket = "remote-backend-bucket07"
}

# Dynamodb-Table is created for STATE-LOCKING
resource "aws_dynamodb_table" "dynamodb_resource" {
	name = "state-locking-table"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockID"
	attribute {
	name = "LockID"
	type = "S"  		# Type String
}
}
