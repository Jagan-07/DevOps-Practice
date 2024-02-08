# variable for local file im main.tf
variable "filename_for_first_file" {
	default = "with_var.txt"
}

variable "content_for_first_file" {
	default = "This file is created using VARIABLE!"
}

##################################################################################

# variable using desired date-type, here map(dictonary - key value pair)
variable "content_map" {
# mention the type and give values according to that type
type = map
default = {
"key1" = "value1, which is content for first file"
"key2" = "value2, which is content for second file"
}
}

##################################################################################

# Same a map this is list type variable to create a list of files
variable "list_files" {
type = list(string) # for numbers in list change (numbers)
default = ["index_0.txt", "index_1.txt", "index_2.txt"]
}

##################################################################################

# variable only by declaring & check resul code in output.tf file
variable "declaring_method_variable" {}
	# Initialling the value using export and TF_VAR command
	# SYNTAX: export TF_VAR_variable_name=value
	# EX: export TF_VAR_declaring_method_varible=valueInitialized!

##################################################################################

# variable using object where we can use user defined data-types
# result code in output.tf file
variable "aws_ec2_obj" {
type = object ({
	name = string
	instances = number
	keys = list(string)
	ami = string
})
default = {
	name = "test_ec2"
	instances = 4
	keys = ["key1.pem","key2.pem"]
	ami = "ami-hdkafjhkh"
}
}
