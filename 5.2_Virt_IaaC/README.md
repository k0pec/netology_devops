# 5.2 Virt IaaC
## Home Work
1. ***Преимущества применения IaaC***
+ Обеспечивается быстрое развертывание инфраструктурыдля, что ускоряет тетирование и вывод на рынок продукта. Обеспечивается стабильность среды и идентичность конфигурации. 
+ Главным преимуществом IaaC является ```идемпотентность``` - это свойство позволяет получать идентичный результат при повторном повторении (например при выкатке конфигурации на сервера на всех инстансах будет идентичная конфигурация).
2. ***Ansible***
+ Ansible использует нативный для линукс систем (кстати, уже и поддерживаемый Windows) SSH. Для остальных систем управления конфигурацие требуется установка "клиентов".   
+ При методе PUSH значительная нагрузка ложиться на сервер конфигурации, так как нужно пройти по всей группе хостов и проверить конфигурацию, а так же есть необходимость держать при большом количестве серверов большой inventory, что может быть причиной ошибок. При методе PULL каждый сервер сам забирает вою конфигурацию, что может снизить нагрузки на сеть при разделении по времени запроса серверов, но есть проблема с поддержкой настроек клиентов. Поэтому метод PUSH считаю надежнее, так как он нагляднее.
3. ***Vagrant-VBox-Ansible***
```bash
k0pec@k0pec-ub:~/netology_devops/5.2_Virt_IaaC$ vagrant --version
Vagrant 2.2.6
```
```bash
k0pec@k0pec-ub:~/netology_devops/5.2_Virt_IaaC$ virtualbox --help
Oracle VM VirtualBox VM Selector v6.1.26_Ubuntu
(C) 2005-2021 Oracle Corporation
All rights reserved.

No special options.

If you are looking for --startvm and related options, you need to use VirtualBoxVM.
```
```bash
k0pec@k0pec-ub:~/netology_devops/5.2_Virt_IaaC$ ansible --version
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/k0pec/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Nov 26 2021, 20:14:08) [GCC 9.3.0]
```
4. ***Выполнение playbook***  
![ansible-playbook](https://github.com/k0pec/netology_devops/blob/main/5.2_Virt_IaaC/ansible.png)