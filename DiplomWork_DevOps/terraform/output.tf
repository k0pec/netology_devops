output "internal_ip_address_pe4enki2n_yandex_cloud" {
  value = "${yandex_compute_instance.pe4enki2n.network_interface.0.ip_address}"
}

output "external_ip_address_pe4enki2n_yandex_cloud" {
  value = "${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_db01_yandex_cloud" {
  value = "${yandex_compute_instance.db01.network_interface.0.ip_address}"
}

output "internal_ip_address_db02_yandex_cloud" {
  value = "${yandex_compute_instance.db02.network_interface.0.ip_address}"
}

output "internal_ip_address_app_yandex_cloud" {
  value = "${yandex_compute_instance.app.network_interface.0.ip_address}"
}

output "internal_ip_address_gitlab_yandex_cloud" {
  value = "${yandex_compute_instance.gitlab.network_interface.0.ip_address}"
}

output "internal_ip_address_runner_yandex_cloud" {
  value = "${yandex_compute_instance.runner.network_interface.0.ip_address}"
}

output "internal_ip_address_monitoring_yandex_cloud" {
  value = "${yandex_compute_instance.monitoring.network_interface.0.ip_address}"
}
# output "internal_ip_address_gitlab_yandex_cloud" {
#   value = "${yandex_compute_instance.gitlab.network_interface.0.ip_address}"
# }

# output "internal_ip_address_grafana_yandex_cloud" {
#   value = "${yandex_compute_instance.grafana.network_interface.0.ip_address}"
# }

# output "internal_ip_address_prometeus_yandex_cloud" {
#   value = "${yandex_compute_instance.prometeus.network_interface.0.ip_address}"
# }

# output "internal_ip_address_alertmanager_yandex_cloud" {
#   value = "${yandex_compute_instance.alertmanager.network_interface.0.ip_address}"
# }
