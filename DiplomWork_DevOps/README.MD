# Diplom Work

### 1. Регистрация доменного имени
+   Домен зарегистрирован у регистратора REG.RU
>![dns_reg](./screens/dns_reg.png)
+   Доменная зона делегирована в Yandex Cloud, A-записи создаются динамически Terraform
>![dns](./screens/dns.png)

### 2. Создание инфраструктуры
+   Создан сервисный аккаунт
>![cloud_user](./screens/cloud_user.png)
+   Перед развертыванием необходимо:
    - добавить в окружение перемкенную $YC_TOKEN
    ```bash
        export YC_TOKEN=<YouToken>
    ```

    - сгенерировать ssh ключи для фронт машины и машин за NAT и добавить public key в файл meta.txt в каталоге terraform

+   Инфраструктура разворачивается из каталога terraform командой 
```bash
    terraform apply --auto-approve
```
>![cloud](./screens/cloud.png)  
>![cloud_vm](./screens/cloud_vm.png)

### 3. Настройка инфраструктуры
+   Настройка производится Ansible из каталога terraform командой
```bash
    ansible-playbook -i ../ansible/hosts ../ansible/<playbook_name>.yml
```
+   Файл hosts формируется динамически при работе Terraform
+   Очередность запуска playbook (плейбуки и роли расположены в каталоге ansible):  
    -   ***ping*** - проверяет доступность хостов для запуска настройки (запускается перед всеми ролями)
    1) ***front*** - разворачивает и конфигурирует на фронтовой машине Nginx и NodeExporter, получает сертификаты SSL для сервисов, доступных снаружи, разворачивает proxy для доступа в интерент машин за NAT;
    2) ***MySQL*** - разворачивает два сервера MySQL c репликацией master-slave;  
    3) ***wordpress*** - разворачивает WordPress на сервере приложений;
    >![site](./screens/site.png)  
    4) ***gitlab*** - разворачивает GitLab;  
    >![gitlab_users](./screens/gitlab_users.png)
    >![gitlab_repo](./screens/gitlab_repo.png)
    >![ssh_config](./screens/ssh_config.png)
    5) ***runner*** - разворачивает Gitlab-Runner;
    >![gitlab_runner](./screens/gitlab_runner.png)  
    >![gitlab_jobs](./screens/gitlab_jobs.png)  
    >![gitlab_jobs2](./screens/gitlab_jobs2.png)  
    6) ***NodeExporter*** - разворачивает NodeExporter на машинах, кроме фронтовой;
    7) ***monitoring*** - разворачивает Prometheus, Grafana, Alertmanager.  
    >![prometheus](./screens/prometheus.png)
    >![grafana](./screens/grafana.png)
    >![alertmanager](./screens/alertmanager.png)

