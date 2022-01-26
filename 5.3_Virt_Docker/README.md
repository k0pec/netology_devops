# 5.3 Virt Docker
## Home Work
1. ***Сборка образа***  
   <code>
   [konstantinpe4enkin](https://hub.docker.com/u/konstantinpe4enkin)
   </code>
2. ***Выбор формы развертывания***  
+ `Высоконагруженное монолитное java веб-приложение;`  
  Так как это монолит, то в этом варианте я считаю более оптимальным использование виртуальной машины. Это позволит обеспечить как отказоустойчивость, так и изоляцию, а так же возможность регулировать выделенные ресурсы.
+ `Nodejs веб-приложение;`  
  В этом случае подойдет Docker, как более удобное средство быстрой сборки и "выкатки"
  приложения.
+ `Мобильное приложение c версиями для Android и iOS;`  
  Здесь подойдет Docker, так как в контейнерах так же удобнее быстро собирать и "раскатывать" приложения, а так же проще контролировать версии и платформы.
+ `Шина данных на базе Apache Kafka;`  
  Так же подойдет Docker для более простого масштабирования, но так же возможно и использование виртуальных машин, так как так же можно выделять ресурсы и обеспечить надежность сервиса.
+ `Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;`  
  Подойдет Docker, потому что легко масштабировать и разделять по физическим хостам (DockerSwarm, Kubernetes).
  Возможен вариант и с виртуальными машинами.
+ `Мониторинг-стек на базе Prometheus и Grafana;`  
  Данный вариант удобно будет расположить в Docker проще масштабировать, обновлять, разворачивать.    
+ `MongoDB, как основное хранилище данных для java-приложения;`  
  В зависимости от того где "жвет" приложение можно так же разместить как в Docker так и на виртуальных машинах.
+ `Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.`  
  Для данного варианта можно применить все вышеперечисленные в задаче подходы (физический сервер, виртуальные машины, Docker).  
3. ***Общая директория для контейнеров***  
   ```yaml
    ---
    version: "3"
    services:
      centos:
        image: centos
        volumes:
          - ./:/data/
        tty: true
      debian:
        image: debian
        volumes:
          - ./:/data/
        tty: true
    ```
    ```bash
    k0pec@k0pec-ub:~/netology_devops/5.3_Virt_Docker/task3$ docker-compose up -d

    Creating network "task3_default" with the default driver
    Pulling centos (centos:)...
    latest: Pulling from library/centos
    a1d0c7532777: Pull complete
    Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
    Status: Downloaded newer image for centos:latest
    Pulling debian (debian:)...
    latest: Pulling from library/debian
    0c6b8ff8c37e: Pull complete
    Digest: sha256:fb45fd4e25abe55a656ca69a7bef70e62099b8bb42a279a5e0ea4ae1ab410e0d
    Status: Downloaded newer image for debian:latest
    Creating task3_centos_1 ... done
    Creating task3_debian_1 ... done

    k0pec@k0pec-ub:~/netology_devops/5.3_Virt_Docker/task3$ docker-compose ps
      Name         Command    State   Ports
    ------------------------------------------
    task3_centos_1   /bin/bash   Up           
    task3_debian_1   bash        Up  

    k0pec@k0pec-ub:~/netology_devops/5.3_Virt_Docker/task3$ docker-compose exec centos /bin/bash

    [root@74a3df1f299d /]# ls
    bin  data  dev	etc  home  lib	lib64  lost+found  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
    [root@74a3df1f299d /]# cd data
    [root@74a3df1f299d data]# echo "my file from centos" > centos.txt
    [root@74a3df1f299d data]# ls
    centos	centos.txt  data  debian  docker-compose.yml
    [root@74a3df1f299d data]# 
    ```
    ```bash
    k0pec@k0pec-ub:~/netology_devops/5.3_Virt_Docker/task3$ ls

    centos  centos.txt  data  debian  docker-compose.yml

    k0pec@k0pec-ub:~/netology_devops/5.3_Virt_Docker/task3$ docker-compose exec debian /bin/bash

    root@d029223ed699:/# ls
    bin  boot  data  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
    root@d029223ed699:/# cd data
    root@d029223ed699:/data# ls
    centos	centos.txt  data  debian  docker-compose.yml
    root@d029223ed699:/data#
    ```
