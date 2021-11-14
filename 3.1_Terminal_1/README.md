# 3.1 Terminal 1
## Home Work
1. Vagrant default vm:
    - cpu: 2
    - ram: 1024 Mb
    - net: nat
    - disk: sata vmdk 64 Gb
    - shared: one directory (directory of vagrant init)
2. Vagrant add:
    - ram: config.vm.provider.memory = <memory-size>
    - cpu: config.vm.provider.cpu = <cpu-count>
3. Bash:
    - history: 792 HISTSIZ
    - ignoreboth: 766 HISTCONTROL
      ignoreboth использовать обе опции 'ignorespace' и 'ignoredups'
      ignorespace 	не сохранять строки начинающиеся с символа <пробел>
      ignoredups 	не сохранять строки, совпадающие с последней выполненной командой
4. {}:
    - 241 {list;}
    - 367 Shell Function Definitions
    - 577 BASH_LINENO
    - 588 BASH_SOURCE
    - 
5. touch:
    - touch a{1..100000}
    - touch a{1..300000} - bash: /usr/bin/touch: Слишком длинный список аргументов
      Потому что есть ограничения систему по количеству передаваемых аргументов.
6. [[-d /tmp]] проверяет наличие директории /tmp и возвращает 0 если нет 1 если есть.
7.  Bash PATH:  
    vagrant@vagrant:~$ type -a bash  
    bash is /usr/bin/bash  
    bash is /bin/bash  
    vagrant@vagrant:~$ mkdir /tmp/new_path_dir/  
    vagrant@vagrant:~$ cp /bin/bash /tmp/new_path_dir/  
    vagrant@vagrant:~$ type -a bash  
    bash is /usr/bin/bash  
    bash is /bin/bash  
    vagrant@vagrant:~$ PATH=/tmp/new_path_dir/:$PATH  
    vagrant@vagrant:~$ type -a bash  
    bash is /tmp/new_path_dir/bash  
    bash is /usr/bin/bash  
    bash is /bin/bash  
8. at - выполняется в указанное время  
   batch - выполниться когда средняя загрузка системы будет 1.5 или равная значению указанному в atd 



