resource "yandex_compute_instance" "pe4enki2n" {
  name                      = "pe4enki2n"
  hostname                  = "pe4enki2n.space"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.instances_img}"
      name        = "root-www"
      type        = "network-nvme"
      size        = "5"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.my_net_a.id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
    #ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
