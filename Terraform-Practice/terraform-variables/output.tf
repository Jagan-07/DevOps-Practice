# result of exported value for declaring method variable
output "declaring_method_variable" {
value = var.declaring_method_variable
}

# result of object variable from variables.tf
output "aws_ec2_info" {
value = var.aws_ec2_obj # to get instances or inside value use "var.aws_ec2_obj.instances"
}
