# Gives the public ip of ec2 instance
output "ec2_public_ip" {
	value = aws_instance.ec2_resource.public_ip
}


output "s3_buckets" {
	value = aws_s3_bucket.s3_resource.bucket
}
