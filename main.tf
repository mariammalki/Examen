
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "cv_image" {
  name = "mariem507/cv-one-page:latest"
}

resource "docker_container" "moncv" {
  name  = "moncv"
  image = docker_image.cv_image.name

  ports {
    internal = 80
    external = 8585
  }
}

