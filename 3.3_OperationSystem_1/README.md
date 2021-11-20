# 3.3 Operation System 1
## Home Work
1.  chdir("/tmp")  
2.  openat(AT_FDCWD, "/usr/share/misc/magic.mgc", O_RDONLY) = 3  
3.  echo '' >/proc/<id процесса приложения>/fd/<файловый дескриптор записываемого файла>  
4.  Зомби не занимают памяти (как процессы-сироты), но блокируют записи в таблице процессов,   
    размер которой ограничен для каждого пользователя и системы в целом.   
5.  root@vagrant:/home/vagrant# /usr/sbin/opensnoop-bpfcc  
    PID    COMM               FD ERR PATH  
    1010   vminfo              6   0 /var/run/utmp  
    584    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services  
    584    dbus-daemon        18   0 /usr/share/dbus-1/system-services  
    584    dbus-daemon        -1   2 /lib/dbus-1/system-services  
    584    dbus-daemon        18   0 /var/lib/snapd/dbus-1/system-services/  
    393    systemd-udevd      14   0 /sys/fs/cgroup/unified/system.slice/systemd-udevd.service/cgroup.procs  
    393    systemd-udevd      14   0 /sys/fs/cgroup/unified/system.slice/systemd-udevd.service/cgroup.threads    
    Отображает все системные файлы по мере их возникновения. Первыми возникают файлы системной шины (инициализация и   управления системой).  
6.  uname({sysname="Linux", nodename="vagrant", ...}) = 0    
    Part of the utsname information is also accessible  via  /proc/sys/ker‐  
       nel/{ostype, hostname, osrelease, version, domainname}.  
7.  ; - просто последовательное выполнение команд  
    && - выполнение команды справа возможно только при успешном выполнении команды слева
    set -e - завершение выполнения, если команда вернула не 0 код возврата.  
    эта директива не работает с конвейерами, ошибка будет возвращена, но выполнение команд конвейера продолжиться.  
8.  -e  Exit immediately if a command exits with a non-zero status.    
    -x  Print commands and their arguments as they are executed.  
    -u  Treat unset variables as an error when substituting.  
    -o  pipefail    the return value of a pipeline is the status of  
                    the last command to exit with a non-zero status,  
                    or zero if no command exited with a non-zero status  
    Завершит скрипт, если какая либо команда выполниться с ошибкой, будет выводить ход выполнения скрипта,  
    неопределенные перепенные считаются ошибками, а следовательно скрипт будет остановлен если они есть,   
    при выполнении с ошибкой, вернет состояние последней команды с ошибкой или 0 при выполнении всех команд.  
9.  vagrant@vagrant:/$ ps -o stat  
    STAT  
    Ss  
    R+  

    S    interruptible sleep (waiting for an event to complete)  
    s    is a session leader  
    R    running or runnable (on run queue)  
    "\+"    is in the foreground process group

