# 8.4 Ansible Modules
## Home Work


#### ***Тест***
```bash
    (venv)kopec@upc:~/ansible $ python -m ansible.modules.my_new_module input.json

    {"invocation": {"module_args": {"content": "some data \nmulti line", "path": "/tmp/test.txt"}}, "message": "file was written", "changed": true, "original_message": "some data \nmulti line"}

    k0pec@upc:~/ansible $ cat /tmp/test.txt
    some data 
    multi line
    k0pec@upc:~/ansible $ 
```

#### ***Playbook***
```bash
    (venv)k0pec@upc:~/ansible $ ansible-playbook test_pb.yml 
    [WARNING]: You are running the development version of Ansible. You should only run
    Ansible from "devel" if you are modifying the Ansible engine, or trying out features
    under development. This is a rapidly changing source of code and can become unstable at
    any point.
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the
    implicit localhost does not match 'all'
    [WARNING]: ansible.utils.display.initialize_locale has not been called, this may result
    in incorrectly calculated text widths that can cause Display to print incorrect line
    lengths

    PLAY [test my module] *******************************************************************

    TASK [Gathering Facts] ******************************************************************
    ok: [localhost]

    TASK [run my module] ********************************************************************
    changed: [localhost]

    TASK [dump test_out] ********************************************************************
    ok: [localhost] => {
        "msg": {
            "changed": true,
            "failed": false,
            "message": "file was written",
            "original_message": "some new content"
        }
    }

    PLAY RECAP ******************************************************************************
    localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

#### ***Идемпотентность***
```bash
    (venv)k0pec@upc:~/ansible $ ansible-playbook test_pb.yml 
    [WARNING]: You are running the development version of Ansible. You should only run Ansible from "devel"
    if you are modifying the Ansible engine, or trying out features under development. This is a rapidly
    changing source of code and can become unstable at any point.
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
    does not match 'all'
    [WARNING]: ansible.utils.display.initialize_locale has not been called, this may result in incorrectly
    calculated text widths that can cause Display to print incorrect line lengths

    PLAY [test my module] **********************************************************************************

    TASK [Gathering Facts] *********************************************************************************
    ok: [localhost]

    TASK [run my module] ***********************************************************************************
    ok: [localhost]

    TASK [dump test_out] ***********************************************************************************
    ok: [localhost] => {
        "msg": {
            "changed": false,
            "failed": false,
            "message": "file was written",
            "original_message": "some new content"
        }
    }

    PLAY RECAP *********************************************************************************************
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

#### ***Роль создана, запущена + идемпотентность вне окружения***
```bash
    k0pec@upc:~/8.4_ansible $ ansible-galaxy collection init my_netology.my_collection
    - Collection my_netology.my_collection was created successfully


    k0pec@upc:~/8.4_ansible $ ansible-playbook site2.yml
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
    does not match 'all'

    PLAY [localhost] ***************************************************************************************

    TASK [Gathering Facts] *********************************************************************************
    ok: [localhost]

    TASK [myrole : run my module] **************************************************************************
    changed: [localhost]

    PLAY RECAP *********************************************************************************************
    localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


    k0pec@upc:~/8.4_ansible $ ansible-playbook site2.yml
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
    does not match 'all'

    PLAY [localhost] ***************************************************************************************

    TASK [Gathering Facts] *********************************************************************************
    ok: [localhost]

    TASK [myrole : run my module] **************************************************************************
    ok: [localhost]

    PLAY RECAP *********************************************************************************************
    localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

    k0pec@upc:~/8.4_ansible $ 
```


#### ***Build Collection***
```bash
    k0pec@upc:~/8.4_ansible/my_collection/my_netology/my_collection $ ansible-galaxy collection build
    Created collection for my_netology.my_collection at /home/alex/devops-projects/myrepo/8_ansible/my_collection/my_netology/my_collection/my_netology-my_collection-1.0.0.tar.gz
```


#### ***Playbook из коллекции***
```bash
    k0pec@upc:~/8.4_ansible $ ansible-playbook site.yml
    [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
    does not match 'all'

    PLAY [test my module] **********************************************************************************

    TASK [Gathering Facts] *********************************************************************************
    ok: [localhost]

    TASK [run my module] ***********************************************************************************
    ok: [localhost]

    TASK [dump test_out] ***********************************************************************************
    ok: [localhost] => {
        "msg": {
            "changed": false,
            "failed": false,
            "message": "file exists",
            "original_message": "some new content"
        }
    }

    PLAY RECAP *********************************************************************************************
    localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

    k0pec@upc:~/8.4_ansible $ tree
    .
    ├── collections
    │   └── ansible_collections
    │       └── my_netology
    │           └── my_collection
    │               ├── docs
    │               ├── FILES.json
    │               ├── MANIFEST.json
    │               ├── plugins
    │               │   ├── modules
    │               │   │   └── my_new_module.py
    │               │   └── README.md
    │               ├── README.md
    │               └── roles
    │                   ├── defaults
    │                   │   └── main.yml
    │                   ├── handlers
    │                   │   └── main.yml
    │                   ├── meta
    │                   │   └── main.yml
    │                   ├── tasks
    │                   │   └── main.yml
    │                   └── vars
    │                       └── main.yml
    ├── group_vars
    │   └── all
    │       └── vars.yml
    ├── inventory
    │   └── prod.yml
    ├── my_netology-my_collection-1.0.0.tar.gz
    ├── site2.yml
    └── site.yml

    k0pec@upc:~/8.4_ansible $ cat site.yml 
    ---
    - name: test my module
        hosts: localhost
        tasks:
        - name  : run my module
        my_netology.my_collection.my_new_module:
            path: "/tmp/file.txt"
            content: "some new content"
        register: test_out
        - name: dump test_out
        debug:
            msg: "{{ test_out }}"  
```
#### ***Репозиторий***
[my_collection](https://github.com/k0pec/my_collection)