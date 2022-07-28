resource "local_file" "hosts" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.
    [front]
    pe4enki2n.space ansible_host=${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address} letsencrypt_email=konstantinpe4enkin@yandex.ru domain_name=pe4enki2n.space

    [db]
    db01.pe4enki2n.space ansible_host=${yandex_compute_instance.db01.network_interface.0.ip_address} mysql_server_id=1 mysql_replication_role=master
    db02.pe4enki2n.space ansible_host=${yandex_compute_instance.db02.network_interface.0.ip_address} mysql_server_id=2 mysql_replication_role=slave
    
    [app]
    app.pe4enki2n.space ansible_host=${yandex_compute_instance.app.network_interface.0.ip_address}

    [gitlab]
    gitlab.pe4enki2n.space ansible_host=${yandex_compute_instance.gitlab.network_interface.0.ip_address}

    [runner]
    runner.pe4enki2n.space ansible_host=${yandex_compute_instance.runner.network_interface.0.ip_address}

    [monitoring]
    monitoring.pe4enki2n.space ansible_host=${yandex_compute_instance.monitoring.network_interface.0.ip_address}

    [proxy]
    pe4enki2n.space ansible_host=${yandex_compute_instance.pe4enki2n.network_interface.0.nat_ip_address}

    [db:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q k0pec@pe4enki2n.space"'

    [app:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q k0pec@pe4enki2n.space"'

    [monitoring:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q k0pec@pe4enki2n.space"'

    [gitlab:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q k0pec@pe4enki2n.space"'

    [runner:vars]
    ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q k0pec@pe4enki2n.space"'

    DOC
  filename = "../ansible/hosts"

  depends_on = [
    yandex_compute_instance.pe4enki2n,
    yandex_compute_instance.db01,
    yandex_compute_instance.db02,
    yandex_compute_instance.app,
    yandex_compute_instance.gitlab,
    yandex_compute_instance.runner,
    yandex_compute_instance.monitoring
  ]
}
