resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  hostname                  = "db01.pe4enki2n.space"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.instances_img}"
      name        = "root-db01"
      type        = "network-nvme"
      size        = "5"
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
