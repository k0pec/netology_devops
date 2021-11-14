# 3.2 Terminal 2
## Home Work
1. cd - встроенная команда bash, меняет текущую папку только для оболочки, в которой выполняется.
2. grep -c <some_string> <some_file>
3. vagrant@vagrant:/$ pstree -p  
    systemd(1)─┬─VBoxService(1024)─┬─{VBoxService}(1026)  
           │                       ├─{VBoxService}(1027)  
           │                       ├─{VBoxService}(1028)  
    vagrant@vagrant:~$ ps aux  
    USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND  
    root           1  0.0  1.1 101804 11132 ?        Ss   19:26   0:00 /sbin/init  

4. ls /root 2>/dev/pts/1
5. vagrant@vagrant:/$ touch inline  
   vagrant@vagrant:/$ nano inline  
   vagrant@vagrant:/$ cat inline  
   qwerty12345  
   vagrant@vagrant:/$ touch outline  
   vagrant@vagrant:/$ cat inline > outline  
   vagrant@vagrant:/$ cat outline  
   qwerty12345  
6. echo "Hello world!" > /dev/tty3  
   Для просмотра вывода нужно переключиться Ctr+Alt+f3  
   В графическом режиме можно использовать двойное перенаправление  
   echo "Hello world!" > /dev/tty3 > dev/pts/2  
   но в tty3 выведено ничего не будет  
7. vagrant@vagrant:/$ bash 5>&1  
   vagrant@vagrant:/$ echo netology > /proc/$$/fd/5  
   netology  
   bash 5>&1 - создаст файловый дескриптор 5  
   echo netology > /proc/$$/fd/5 - перенаправление stdout в дескриптор 5  
8. vagrant@vagrant:/$ ls /root 5>&2 2>&1 1>&5 | grep -c denied  
   1  
9. cat /proc/$$/environ -  вывод переменных окружения  
   env, printenv  
10. /proc/<PID>/cmdline - полный путь до исполняемого файла процесса  
    /proc/<PID>/exe - содержит ссылку до файла запущенного для процесса  
11. sse4_2  
12. vagrant@vagrant:/$ ssh localhost 'tty'  
    vagrant@localhost's password:  
    not a tty  
    По умолчанию, когда вы запускаете команду на удаленном компьютере с помощью ssh, TTY не выделяется для удаленного   сеанса.  
    ssh -t localhost 'tty' - решает данную проблему.  
    304 - t Принудительное выделение псевдотерминала.  
13. k0pec@k0pec-ub:/netology_devops/3.1_Terminal_1/vagrant$ ps aux | grep notepadqq  
    k0pec      19445  1.6  0.7 2101088 126828 pts/2  Sl+  00:57   0:00 /snap/notepadqq/855/usr/local/lib/notepadqq/notepadqq-bin  
    k0pec      19600  0.0  0.0  17696   736 pts/1    S+   00:57   0:00 grep --color=auto notepadqq  
    k0pec@k0pec-ub:/netology_devops/3.1_Terminal_1/vagrant$ sudo reptyr 19445  
    [-] Unable to open the tty in the child.  
    Unable to attach to pid 19445: No such file or directory  
14. tee - запись вывода любой команды в один или несколько файлов.  
    sudo echo string > /root/new_file - с правами суперпользователя выполниться только вывод в stdout, но его   перенаправление будет с правами пользователя.  
    echo string | sudo tee /root/new_file - tee получит на stdin stdout команды echo и так как запущена с правами   суперпользователя, то сможет записать в файл в директории /root  







