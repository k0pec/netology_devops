# 7.1 Terraform Intro
## Home Work

***Task 1***  
1. Ответить на четыре вопроса представленных в разделе "Легенда".
- Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?
    + _на мой взгляд лучше использовать неизменяемый тип инфраструктуры, так как количество релизов будет большое и нужно будет обеспечит неизменяемость конфигурации инфраструктуры для быстрой и корректной доработки продукта_
- Будет ли центральный сервер для управления инфраструктурой?
    + _считаю, что в текущей ситуации лучше использовать подход без центрального сервера_
- Будут ли агенты на серверах?
    + _подход без использования агентов будет уместнее, так как требует менше накладных расходов на установку и настройку в условиях часто меняющейся инфраструктуры_
- Будут ли использованы средства для управления конфигурацией или инициализации ресурсов?
    + _будут, така это позволит легче контролировать конфигурацию, проверять ее валидность_
2. Какие инструменты из уже используемых вы хотели бы использовать для нового проекта?
   + _Docker, Packer, Terraform, Teamcity, Ansible, Kubernetes._
3. Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта?
   + _для хранения конфигураций и манифестов стоит использовать Git_

***Task 2***
```bash
    k0pec@k0pec-ub:~/netology_devops$ terraform --version
    Terraform v1.1.6
    on linux_amd64

    Your version of Terraform is out of date! The latest version
    is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html
 
```

***Task 3***
```bash
    k0pec@k0pec-ub:~$ terraform_1.1.6 --version
    Terraform v1.1.6
    on linux_amd64

    Your version of Terraform is out of date! The latest version
    is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html

    k0pec@k0pec-ub:~$ terraform_1.1.7 --version
    Terraform v1.1.7
    on linux_amd64

```