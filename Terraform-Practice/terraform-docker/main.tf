# Pre-requesits
# 	--> Docker should be installed in the server
# pulls docker image and create a container from that image.
terraform {
	required_providers {
		docker = {
		source = "kreuzwerker/docker"
		version = "~> 3.0.2"
}
}
}

provider "docker" {}

# Pulls the image
resource "docker_image" "nginx_image_resource" {
	name = "nginx:latest"
	keep_locally = false
}

# Create a container and port binding
resource "docker_container" "nginx_container_resource" {
	name = "nginx_container"
	image = docker_image.nginx_image_resource.image_id
	ports {
		internal = 80
		external = 80
}
}
