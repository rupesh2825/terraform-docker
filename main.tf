terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "terraform-nginx"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 9090
  }
}

