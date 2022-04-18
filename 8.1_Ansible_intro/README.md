# 8.1 Ansible intro
## Home Work
***Task 1***
```bash
    14:36:51 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/test.yml site.yml 
    PLAY [Print os facts] ***********************************************************************************

    TASK [Gathering Facts] **********************************************************************************
    [DEPRECATION WARNING]: Distribution Ubuntu 20.04 on host localhost should use /usr/bin/python3, but is 
    using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible release 
    will default to using the discovered platform python for this host. See 
    https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more 
    information. This feature will be removed in version 2.12. Deprecation warnings can be disabled by 
    setting deprecation_warnings=False in ansible.cfg.
    ok: [localhost]

    TASK [Print OS] *****************************************************************************************
    ok: [localhost] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ***************************************************************************************
    ok: [localhost] => {
        "msg": 12
    }

    PLAY RECAP **********************************************************************************************
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
***Task 2***
```bash
    14:49:41 test@upc(0):~/devops-ansible/1$ cat group_vars/all/examp.yml
```
---
  some_fact: "all default fact"

Сокращенный вывод:
```bash
    14:49:55 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/test.yml site.yml 

    .......

    TASK [Print fact] *********************************************************************************************************
    ok: [localhost] => {
        "msg": "all default fact"
    }

    PLAY RECAP ****************************************************************************************************************
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
***Task 3***  
    Ok  
***Task 4***
```bash
    14:52:47 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/prod.yml site.yml 

    PLAY [Print os facts] **************************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************************************
    ok: [centos7]
    ok: [ubuntu]

    TASK [Print OS] ********************************************************************************************************************************
    ok: [centos7] => {
        "msg": "CentOS"
    }
    ok: [ubuntu] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ******************************************************************************************************************************
    ok: [centos7] => {
        "msg": "el"
    }
    ok: [ubuntu] => {
        "msg": "deb"
    }

    PLAY RECAP *************************************************************************************************************************************
    centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
***Task 5***
```bash
    15:01:00 test@upc(0):~/devops-ansible/1$ cat group_vars/deb/examp.yml ;echo ""
    ---
    some_fact: "deb default fact"
    15:01:08 test@upc(0):~/devops-ansible/1$ cat group_vars/el/examp.yml ;echo ""
    ---
    some_fact: "el default fact"
    15:01:14 test@upc(0):~/devops-ansible/1$ 
```
***Task 6***
```bash
    15:01:14 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/prod.yml site.yml 

    PLAY [Print os facts] **************************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************************************
    ok: [centos7]
    ok: [ubuntu]

    TASK [Print OS] ********************************************************************************************************************************
    ok: [centos7] => {
        "msg": "CentOS"
    }
    ok: [ubuntu] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ******************************************************************************************************************************
    ok: [centos7] => {
        "msg": "el default fact"
    }
    ok: [ubuntu] => {
        "msg": "deb default fact"
    }

    PLAY RECAP *************************************************************************************************************************************
    centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
***Task 7***
```bash
    15:03:26 test@upc(0):~/devops-ansible/1$ ansible-vault encrypt group_vars/deb/examp.yml 
    New Vault password: 
    Confirm New Vault password: 
    Encryption successful
    15:03:54 test@upc(0):~/devops-ansible/1$ ansible-vault encrypt group_vars/el/examp.yml 
    New Vault password: 
    Confirm New Vault password: 
    Encryption successful
```
***Task 8***
```bash
    15:11:23 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
    Vault password: 

    PLAY [Print os facts] **************************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************************************
    ok: [ubuntu]
    ok: [centos7]

    TASK [Print OS] ********************************************************************************************************************************
    ok: [centos7] => {
        "msg": "CentOS"
    }
    ok: [ubuntu] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ******************************************************************************************************************************
    ok: [centos7] => {
        "msg": "el default fact"
    }
    ok: [ubuntu] => {
        "msg": "deb default fact"
    }

    PLAY RECAP *************************************************************************************************************************************
    centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
***Task 9***  
+   нужен "local"
***Task 10***
```bash
    15:48:07 test@upc(0):~/devops-ansible/1$ cat inventory/prod.yml ; echo ""
    ---
    el:
        hosts:
        centos7:
            ansible_connection: docker
    deb:
        hosts:
        ubuntu:
            ansible_connection: docker
    local:
        hosts:
        localhost:
            ansible_connection: local
```
***Task 11***
```bash
    15:38:28 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
    Vault password: 

    PLAY [Print os facts] **************************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************************************
    [DEPRECATION WARNING]: Distribution Ubuntu 20.04 on host localhost should use /usr/bin/python3, but is using /usr/bin/python for backward 
    compatibility with prior Ansible releases. A future Ansible release will default to using the discovered platform python for this host. See 
    https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in 
    version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
    ok: [localhost]
    ok: [centos7]
    ok: [ubuntu]

    TASK [Print OS] ********************************************************************************************************************************
    ok: [localhost] => {
        "msg": "Ubuntu"
    }
    ok: [centos7] => {
        "msg": "CentOS"
    }
    ok: [ubuntu] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ******************************************************************************************************************************
    ok: [localhost] => {
        "msg": "all default fact"
    }
    ok: [centos7] => {
        "msg": "el default fact"
    }
    ok: [ubuntu] => {
        "msg": "deb default fact"
    }

    PLAY RECAP *************************************************************************************************************************************
    centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
```bash
    15:40:03 test@upc(0):~/devops-ansible/1$ ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
    Vault password: 

    PLAY [Print os facts] **************************************************************************************************************************

    TASK [Gathering Facts] *************************************************************************************************************************
    [DEPRECATION WARNING]: Distribution Ubuntu 20.04 on host localhost should use /usr/bin/python3, but is using /usr/bin/python for backward 
    compatibility with prior Ansible releases. A future Ansible release will default to using the discovered platform python for this host. See 
    https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in 
    version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
    ok: [localhost]
    ok: [centos7]
    ok: [ubuntu]

    TASK [Print OS] ********************************************************************************************************************************
    ok: [localhost] => {
        "msg": "Ubuntu"
    }
    ok: [centos7] => {
        "msg": "CentOS"
    }
    ok: [ubuntu] => {
        "msg": "Ubuntu"
    }

    TASK [Print fact] ******************************************************************************************************************************
    ok: [localhost] => {
        "msg": "local default fact"
    }
    ok: [centos7] => {
        "msg": "el default fact"
    }
    ok: [ubuntu] => {
        "msg": "deb default fact"
    }

    PLAY RECAP *************************************************************************************************************************************
    centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
***Task 12***  
https://github.com/k0pec/netology_devops/tree/main/8.1_Ansible_intro
