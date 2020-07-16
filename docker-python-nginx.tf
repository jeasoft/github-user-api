provider "docker" {
  host = "ssh://jeasoft@10.0.0.12:22"
}

resource "docker_image" "nginx" {
  name = "nginx:stable-alpine"
}

resource "docker_container" "nginx-server" {
  count = 2
  name = "nginx-server-${count.index+1}"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/scrapbook/tutorial/www"
    read_only = true
  }
}
