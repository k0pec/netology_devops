resource "yandex_compute_instance" "db02" {
  name                      = "db02"
  hostname                  = "db02.pe4enki2n.space"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.instances_img}"
      name        = "root-db02"
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
