# 3.4 Operation System 2
## Home Work
1.  systemctl edit --full --force node_exporter.service    
    [Unit]
    Description=Node Exporter
    [Service]
    EnvironmentFile=/etc/default/node_exporter
    ExecStart=/usr/local/bin/node_exporter $OPTIONS
    [Install]
    WantedBy=default.target  
      
    nano /var/lib/node_exporter/textfile_collector
    OPTIONS="--collector.textfile.directory /var/lib/node_exporter/textfile_collector"    

    systemctl enable node_exporter.service    
    systemctl start node_exporter.service    
    vagrant@vagrant:/vagrant/node_exporter$ sudo systemctl status node_exporter.service  
    ● node_exporter.service - Node Exporter  
        Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)  
        Active: active (running) since Wed 2021-11-24 17:27:02 UTC; 13s ago  
        Main PID: 12780 (node_exporter)  
            Tasks: 4 (limit: 1071)  
            Memory: 2.3M  
            CGroup: /system.slice/node_exporter.service  
                    └─12780 /usr/local/bin/node_exporter --collector.textfile.directory /var/lib/node_exporter/textfile_collector  


2.  CPU:  
    node_cpu_seconds_total{cpu="0",mode="idle"}  
    node_cpu_seconds_total{cpu="0",mode="system"}   
    node_cpu_seconds_total{cpu="0",mode="user"}   
    process_cpu_seconds_total  
      
    Memory:  
    node_memory_MemAvailable_bytes   
    node_memory_MemFree_bytes  
      
    Disk:  
    node_disk_io_time_seconds_total{device="sda"}   
    node_disk_read_bytes_total{device="sda"}   
    node_disk_read_time_seconds_total{device="sda"}   
    node_disk_write_time_seconds_total{device="sda"}  
      
    Network:  
    node_network_receive_errs_total{device="eth0"}   
    node_network_receive_bytes_total{device="eth0"}   
    node_network_transmit_bytes_total{device="eth0"}  
    node_network_transmit_errs_total{device="eth0"}  

3.  k0pec/netology_devops/3.4_OperationSystem_2/screen.png
4.  Да, определить что система на ВМ можно  
    Железо:  
    [    0.000000] NX (Execute Disable) protection: active  
    [    0.000000] SMBIOS 3.1.1 present.  
    [    0.000000] DMI: Gigabyte Technology Co., Ltd. B365M D3H/B365M D3H-CF, BIOS F1 05/14/2019  
    [    0.000000] tsc: Detected 2900.000 MHz processor  
    [    0.000000] tsc: Detected 2899.886 MHz TSC  

    Виртуализация:    
    [    0.000000] SMBIOS 2.5 present.  
    [    0.000000] DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006  
    [    0.000000] Hypervisor detected: KVM  
    [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00  
    [    0.000000] kvm-clock: cpu 0, msr fc01001, primary cpu clock  
    [    0.000000] kvm-clock: using sched offset of 4004584876 cycles  
    [    0.000001] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns  
    [    0.000003] tsc: Detected 2904.000 MHz processor  
    [    0.002186] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved  
    [    0.002188] e820: remove [mem 0x000a0000-0x000fffff] usable  
    [    0.002190] last_pfn = 0x3fff0 max_arch_pfn = 0x400000000  
5.  vagrant@vagrant:~$ sysctl fs.nr_open  
    fs.nr_open = 1048576  
    Лимит на количество открытых дескрипторов.  
    ulimit -Sn, ulimit -Hn  
6.  root        1508  0.0  0.0   8080   596 pts/1    S+   22:21   0:00 unshare -f --pid --mount-proc sleep 1h  
    root        1509  0.0  0.0   8076   592 pts/1    S+   22:21   0:00 sleep 1h  
    vagrant     1510  0.0  0.3  11492  3428 pts/2    R+   22:21   0:00 ps aux  
    root@vagrant:/home/vagrant# nsenter --target 1509 --pid --mount  
    root@vagrant:/# ps aux  
    USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND  
    root           1  0.0  0.0   8076   592 pts/1    S+   22:21   0:00 sleep 1h  
    root           2  0.1  0.4   9836  4020 pts/2    S    22:24   0:00 -bash  
    root          11  0.0  0.3  11492  3260 pts/2    R+   22:24   0:00 ps aux  
7.  В действительности эта команда является логической бомбой. Она оперирует определением функции с именем ‘:‘, <br/>    которая  вызывает сама себя дважды: один раз на переднем плане и один раз в фоне. Она продолжает своё выполнение <br/> снова и снова, пока система не зависнет. <br/>  
    [ 3027.757801] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-6.scope  
    ulimit -u 50 - число процессов будет ограниченно 50 для пользоователя  


      
