# Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

## Обязательная задача 1

Есть скрипт:
```python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```

### Вопросы:
| Вопрос  | Ответ |
| ------------- | ------------- |
| Какое значение будет присвоено переменной `c`?  | нельзя выполнить сложение целочисленного типа и строкого типа данных без преобразования |
| Как получить для переменной `c` значение 12?  | c=int(str(a)+b)  |
| Как получить для переменной `c` значение 3?  | c = a + int(b) |

## Обязательная задача 2
Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:
```python
#!/usr/bin/env python3

mport os

bash_command = ["cd ~/netology_devops", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено:   ', '')
        print(prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```
k0pec@k0pec-ub:~/netology_devops$ python3 4.2_Python/test.py
   4.2_Python/README.md
```

## Обязательная задача 3
1. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:
```python
import os
import sys

cmd = os.getcwd()

if len(sys.argv)>=2:
    cmd = sys.argv[1]
bash_command = ["cd " + cmd, "git status 2>&1"]

result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('fatal') != -1:
        print(cmd + '   не является GIT репозиторием')
    if result.find('изменено') != -1:
        prepare_result = result.replace('\tизменено: ', '')
        prepare_result = prepare_result.replace(' ', '') 
        print(cmd + '/' +prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```
k0pec@k0pec-ub:~/netology_devops$ python3 4.2_Python/test2.py ~/netology_devops
/home/k0pec/netology_devops/4.2_Python/README.md
k0pec@k0pec-ub:~/netology_devops$ python3 4.2_Python/test2.py ~/vagrant
/home/k0pec/vagrant   не является GIT репозиторием
```

## Обязательная задача 4
1. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: `drive.google.com`, `mail.google.com`, `google.com`.

### Ваш скрипт:
```python
import socket as s
import time as t

wait = 2
srv = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}

while 1==1 :
  for host in srv:
    ip = s.gethostbyname(host)
    if ip != srv[host]:
        print(str('[ERROR] ' + str(host) + ' IP mistmatch: ' + srv[host] + ' ' + ip))
    srv[host]=ip
  t.sleep(wait)
```

### Вывод скрипта при запуске при тестировании:
```
k0pec@k0pec-ub:~/netology_devops$ python3 4.2_Python/test3.py
[ERROR] drive.google.com IP mistmatch: 0.0.0.0 64.233.165.194
[ERROR] mail.google.com IP mistmatch: 0.0.0.0 173.194.221.19
[ERROR] google.com IP mistmatch: 0.0.0.0 173.194.73.101
[ERROR] drive.google.com IP mistmatch: 64.233.165.194 74.125.205.194
[ERROR] mail.google.com IP mistmatch: 173.194.221.19 64.233.164.17
[ERROR] google.com IP mistmatch: 173.194.73.101 173.194.73.100
[ERROR] google.com IP mistmatch: 173.194.73.100 173.194.73.102
[ERROR] mail.google.com IP mistmatch: 64.233.164.17 173.194.221.19
[ERROR] google.com IP mistmatch: 173.194.73.102 173.194.73.139
[ERROR] drive.google.com IP mistmatch: 74.125.205.194 173.194.222.194
[ERROR] google.com IP mistmatch: 173.194.73.139 173.194.73.100

```