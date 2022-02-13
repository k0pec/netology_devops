# 5.5 Virt. Docker Swarm.
## Home Work
1. ***Task 1***  
  + Отличие режимов replication и global.
    - в режиме replication будет развернуто указанное количество инстансов приложения и только на worker-нодах.
    - в режиме global будет инстанс приложения будет развернут на каждой ноде кластера (включая manager-ноды).
  + В  docker swarm кластере испопользуется алгоритм Raft.  
  + Overlay network это виртуальная сеть кластера docker swarm  используемая контейнерами и связывающая ноды кластера между собой.
2. ***Task 2***
   ![task 2](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-2(cli).png)  
3. ***Task 3***
   ![task 3](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-3(cli).png)  
4. ***Task 4***
   ```
   docker swarm update --autolock=true
   ```
  + эта команда нужна для защиты кластера, при потере узла он становиться недоступен до ручной разблокировки с введением ключа.  
  ![task 4_1](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-4(leader-down).png)  
  ![task 4_2](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-4(new-leader_2).png)  
  ![task 4_3](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-4(lock-leader_unreach).png)
  ![task 4_4](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-4(leader-lock_unlock).png)    
  ![task 4_5](https://github.com/k0pec/netology_devops/blob/main/5.5_Virt_Docker-Swarm/5.5_task-4(leader-lock-reach).png) 
  
  
   