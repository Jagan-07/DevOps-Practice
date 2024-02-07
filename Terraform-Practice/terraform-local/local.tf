# Create a local file with name and content wich are provided as a atributs
resource "local_file" "textfile" {
	filename = "first_tf_file.txt"
	content = "This is the first terraform file!!!"
}

# creates a random string according to the specified conditions
resource "random_string" "rand_str" {
length = 15
special = true
override_special = "!@#$%^&?"
}

# CHECK THE OUTPUTS IN "OUTPUT.TF" FILE
