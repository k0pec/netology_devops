# Домашнее задание к занятию "4.3. Языки разметки JSON и YAML"


## Обязательная задача 1
Мы выгрузили JSON, который получили через API запрос к нашему сервису:
```
    { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            }
            { "name" : "second",
            "type" : "proxy",
            "ip" : "71.78.22.43"
            }
        ]
    }
```
  Нужно найти и исправить все ошибки, которые допускает наш сервис

## Обязательная задача 2
В прошлый рабочий день мы создавали скрипт, позволяющий опрашивать веб-сервисы и получать их IP. К уже реализованному функционалу нам нужно добавить возможность записи JSON и YAML файлов, описывающих наши сервисы. Формат записи JSON по одному сервису: `{ "имя сервиса" : "его IP"}`. Формат записи YAML по одному сервису: `- имя сервиса: его IP`. Если в момент исполнения скрипта меняется IP у сервиса - он должен так же поменяться в yml и json файле.

### Ваш скрипт:
```python
import socket as s
import time as t
import json
import yaml

wait = 2
srv = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}

while 1==1 :
  
  for host in srv:
    ip = s.gethostbyname(host)
    if ip != srv[host]:
        print(str('[ERROR] ' + str(host) + ' IP mistmatch: ' + srv[host] + ' ' + ip))
    srv[host]=ip
    with open("srv.json",'w') as jsf:
      json_data= json.dumps(srv)
      jsf.write(json_data)
    with open("srv.yaml",'w') as ymf:
      yaml_data= yaml.dump(srv)
      ymf.write(yaml_data)
  t.sleep(wait)
```

### Вывод скрипта при запуске при тестировании:
```
k0pec@k0pec-ub:~/netology_devops/4.2_Python$ python3 test3.py
[ERROR] drive.google.com IP mistmatch: 0.0.0.0 142.251.1.194
[ERROR] mail.google.com IP mistmatch: 0.0.0.0 173.194.221.18
[ERROR] google.com IP mistmatch: 0.0.0.0 108.177.14.100
[ERROR] google.com IP mistmatch: 108.177.14.100 108.177.14.102
```

### json-файл(ы), который(е) записал ваш скрипт:
```json
k0pec@k0pec-ub:~/netology_devops/4.2_Python$ cat srv.json
{"drive.google.com": "64.233.165.194", "mail.google.com": "173.194.221.18", "google.com": "173.194.73.139"}

```

### yml-файл(ы), который(е) записал ваш скрипт:
```yaml
k0pec@k0pec-ub:~/netology_devops/4.2_Python$ cat srv.yaml
drive.google.com: 64.233.165.194
google.com: 173.194.73.139
mail.google.com: 173.194.221.18
```