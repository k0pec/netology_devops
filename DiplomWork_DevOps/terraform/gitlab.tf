resource "yandex_compute_instance" "gitlab" {
  name                      = "gitlab"
  hostname                  = "gitlab.pe4enki2n.space"

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.instances_img}"
      name        = "root-gitlab"
      type        = "network-nvme"
      size        = "15"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.my_net_a.id}"
    nat       = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
