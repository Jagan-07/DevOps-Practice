# create a file without using variable
resource "local_file" "text_file_resource" {
	filename = "without_var.txt"
	content = "This file is created without using VARIABLE!"
}

# create a file using variable from variable.tf file
resource "local_file" "text_file_resource2" {
	filename = var.filename_for_first_file
	content = var.content_for_first_file
}

##################################################################################################

# test file for validating desired data-type [ map content_map variable ]
resource "local_file" "map_file" {
	filename = "content_file1.txt"
	content = var.content_map["key1"]
}

# content form 2nd key
resource "local_file" "map_file2" {
        filename = "content_file2.txt"
        content = var.content_map["key2"]
}

###################################################################################################

# create list of files using list variable
resource "local_file" "list_file" {
	filename = var.list_files[0]
	content = "This file is create form the list of files mentioned in the list variable."
}


