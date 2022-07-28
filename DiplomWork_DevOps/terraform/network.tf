# Network
resource "yandex_vpc_network" "my_net" {
  name = "net"
}

resource "yandex_vpc_subnet" "my_net_a" {
  name = "subnet_a"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.my_net.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
}

resource "yandex_vpc_subnet" "my_net_b" {
  name = "subnet_b"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.my_net.id}"
  v4_cidr_blocks = ["192.168.102.0/24"]
}

resource "yandex_dns_zone" "pe4enki2n-space" {
  name        = "pe4enki2n-space"
  description = "my_zone_regru"

  labels = {
    label1 = "label-1-value"
  }

  zone             = "pe4enki2n.space."
  public           = true
}

resource "yandex_dns_recordset" "root" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "@"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "www" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "www"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "gitlab" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "gitlab"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "grafana"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = yandex_dns_zone.pe4enki2n-space.id
  name    = "prometheus"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"]
}