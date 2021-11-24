# 3.5 File System
## Home Work
1. sparse (разряженные) - это файлы, которые не содержат нулевых байт. вместо записи на диск нулевых байт информация о них находиться в метаданных файловой системы. Поэтому эти файлы реально на диске занимают гараздо меньше, чем их номинальный размер.  
   
2. не могут, так как имеют теже разрешения, что и исходный файл.

3. vm запущена
   
4. root@vagrant:/home/vagrant# fdisk /dev/sdb  

    Welcome to fdisk (util-linux 2.34).  
    Changes will remain in memory only, until you decide to write them.  
    Be careful before using the write command.  

    Device does not contain a recognized partition table.  
    Created a new DOS disklabel with disk identifier 0xdf361fe2.  

    Command (m for help): n  
    Partition type  
    p   primary (0 primary, 0 extended, 4 free)  
    e   extended (container for logical partitions)  
    Select (default p): p  
    Partition number (1-4, default 1):   
    First sector (2048-5242879, default 2048):   
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-5242879, default 5242879): +2G  

    Created a new partition 1 of type 'Linux' and of size 2 GiB.  

    Command (m for help): n  
    Partition type  
    p   primary (1 primary, 0 extended, 3 free)  
    e   extended (container for logical partitions)  
    Select (default p): p  
    Partition number (2-4, default 2):   
    First sector (4196352-5242879, default 4196352):   
    Last sector, +/-sectors or +/-size{K,M,G,T,P} (4196352-5242879, default 5242879):   

    Created a new partition 2 of type 'Linux' and of size 511 MiB.  

    Command (m for help): w  
    The partition table has been altered.  
    Calling ioctl() to re-read partition table.  
    Syncing disks.  
    root@vagrant:/home/vagrant# fdisk -l /dev/sdb  
    Disk /dev/sdb: 2.51 GiB, 2684354560 bytes, 5242880 sectors  
    Disk model: VBOX HARDDISK     
    Units: sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  
    Disklabel type: dos  
    Disk identifier: 0xdf361fe2  

    Device     Boot   Start     End Sectors  Size Id Type  
    /dev/sdb1          2048 4196351 4194304    2G 83 Linux  
    /dev/sdb2       4196352 5242879 1046528  511M 83 Linux  

5.  root@vagrant:/home/vagrant# sfdisk -d /dev/sdb > /vagrant/sdb  
    root@vagrant:/home/vagrant# sfdisk /dev/sdc < /vagrant/sdb  
    Checking that no-one is using this disk right now ... OK  

    Disk /dev/sdc: 2.51 GiB, 2684354560 bytes, 5242880 sectors  
    Disk model: VBOX HARDDISK     
    Units: sectors of 1 * 512 = 512 bytes  
    Sector size (logical/physical): 512 bytes / 512 bytes  
    I/O size (minimum/optimal): 512 bytes / 512 bytes  

    >>> Script header accepted.  
    >>> Script header accepted.  
    >>> Script header accepted.  
    >>> Script header accepted.  
    >>> Created a new DOS disklabel with disk identifier 0xdf361fe2.  
    /dev/sdc1: Created a new partition 1 of type 'Linux' and of size 2 GiB.  
    /dev/sdc2: Created a new partition 2 of type 'Linux' and of size 511 MiB.  
    /dev/sdc3: Done.  

    New situation:  
    Disklabel type: dos  
    Disk identifier: 0xdf361fe2  

    Device     Boot   Start     End Sectors  Size Id Type  
    /dev/sdc1          2048 4196351 4194304    2G 83 Linux  
    /dev/sdc2       4196352 5242879 1046528  511M 83 Linux  

    The partition table has been altered.  
    Calling ioctl() to re-read partition table.  
    Syncing disks.  
6.  root@vagrant:/home/vagrant# mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1  
    mdadm: Note: this array has metadata at the start and  
        may not be suitable as a boot device.  If you plan to  
        store '/boot' on this device please ensure that  
        your boot-loader understands md/v1.x metadata, or use  
        --metadata=0.90  
    Continue creating array? y  
    mdadm: Defaulting to version 1.2 metadata  
    mdadm: array /dev/md1 started.  
    root@vagrant:/home/vagrant# mdadm --detail /dev/md1  
    /dev/md1:  
            Version : 1.2  
        Creation Time : Wed Nov 24 19:43:38 2021  
            Raid Level : raid1  
            Array Size : 2094080 (2045.00 MiB 2144.34 MB)  
        Used Dev Size : 2094080 (2045.00 MiB 2144.34 MB)  
        Raid Devices : 2  
        Total Devices : 2  
        Persistence : Superblock is persistent  

        Update Time : Wed Nov 24 19:43:48 2021  
                State : clean   
        Active Devices : 2  
    Working Devices : 2  
        Failed Devices : 0  
        Spare Devices : 0  

    Consistency Policy : resync  

                Name : vagrant:1  (local to host vagrant)  
                UUID : 62d42066:b874cda6:fef3d46c:f02eaa03  
                Events : 17  

        Number   Major   Minor   RaidDevice State  
        0       8       17        0      active sync   /dev/sdb1  
        1       8       33        1      active sync   /dev/sdc1  

7.  oot@vagrant:/home/vagrant# mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/sdb2 /dev/sdc2  
    mdadm: Defaulting to version 1.2 metadata  
    mdadm: array /dev/md0 started.  
    root@vagrant:/home/vagrant# mdadm --detail /dev/md0  
    /dev/md0:  
            Version : 1.2  
        Creation Time : Wed Nov 24 19:46:02 2021  
            Raid Level : raid0  
            Array Size : 1042432 (1018.00 MiB 1067.45 MB)  
        Raid Devices : 2  
        Total Devices : 2  
        Persistence : Superblock is persistent  

        Update Time : Wed Nov 24 19:46:02 2021  
                State : clean   
        Active Devices : 2  
    Working Devices : 2  
        Failed Devices : 0  
        Spare Devices : 0  

                Layout : -unknown-  
            Chunk Size : 512K  

    Consistency Policy : none  

                Name : vagrant:0  (local to host vagrant)  
                UUID : 3528c164:2cd2a58a:3026bd34:7fbcc9fb  
                Events : 0  

        Number   Major   Minor   RaidDevice State  
        0       8       18        0      active sync   /dev/sdb2  
        1       8       34        1      active sync   /dev/sdc2  

8.  root@vagrant:/home/vagrant# pvcreate /dev/md0  
    Physical volume "/dev/md0" successfully created.  
    root@vagrant:/home/vagrant# pvcreate /dev/md1  
    Physical volume "/dev/md1" successfully created.  
    root@vagrant:/home/vagrant# pvdisplay  
    --- Physical volume ---  
    PV Name               /dev/sda5  
    VG Name               vgvagrant  
    PV Size               <63.50 GiB / not usable 0     
    Allocatable           yes (but full)  
    PE Size               4.00 MiB  
    Total PE              16255  
    Free PE               0  
    Allocated PE          16255  
    PV UUID               Mx3LcA-uMnN-h9yB-gC2w-qm7w-skx0-OsTz9z  
    
    "/dev/md0" is a new physical volume of "1018.00 MiB"  
    --- NEW Physical volume ---  
    PV Name               /dev/md0  
    VG Name                 
    PV Size               1018.00 MiB  
    Allocatable           NO  
    PE Size               0     
    Total PE              0  
    Free PE               0  
    Allocated PE          0  
    PV UUID               dlLEFV-DHto-L0Ti-pmxC-Vujf-HQft-Nedrye  
    
    "/dev/md1" is a new physical volume of "<2.00 GiB"  
    --- NEW Physical volume ---  
    PV Name               /dev/md1  
    VG Name                 
    PV Size               <2.00 GiB  
    Allocatable           NO  
    PE Size               0     
    Total PE              0  
    Free PE               0  
    Allocated PE          0  
    PV UUID               UvCJiQ-QXYl-GhvX-8mMS-Zf4Y-cCoq-eiKdPn  

9.  root@vagrant:/home/vagrant# vgcreate volgr /dev/md0 /dev/md1  
    Volume group "volgr" successfully created  
    root@vagrant:/home/vagrant# vgdisplay volgr  
    --- Volume group ---  
    VG Name               volgr  
    System ID               
    Format                lvm2  
    Metadata Areas        2  
    Metadata Sequence No  1  
    VG Access             read/write  
    VG Status             resizable  
    MAX LV                0  
    Cur LV                0  
    Open LV               0  
    Max PV                0  
    Cur PV                2  
    Act PV                2  
    VG Size               <2.99 GiB  
    PE Size               4.00 MiB  
    Total PE              765  
    Alloc PE / Size       0 / 0     
    Free  PE / Size       765 / <2.99 GiB  
    VG UUID               wXSHXt-Y43o-kzZ4-PU4G-aUAg-JVcn-Uz8QBj  

10. root@vagrant:/home/vagrant# lvcreate -L 100M -n lv1 volgr /dev/md0  
    Logical volume "lv1" created.  

    root@vagrant:/home/vagrant# lvdisplay /dev/volgr/lv1   
    --- Logical volume ---  
    LV Path                /dev/volgr/lv1  
    LV Name                lv1  
    VG Name                volgr  
    LV UUID                qN2ZYD-BNil-30TJ-Ffco-mcub-6Beg-JEzQLL  
    LV Write Access        read/write  
    LV Creation host, time vagrant, 2021-11-24 20:18:35 +0000  
    LV Status              available  
    # open                 0  
    LV Size                100.00 MiB  
    Current LE             25  
    Segments               1  
    Allocation             inherit  
    Read ahead sectors     auto  
    - currently set to     4096  
    Block device           253:2  
11. root@vagrant:/home/vagrant# mkfs.ext4 /dev/volgr/lv1  
    mke2fs 1.45.5 (07-Jan-2020)  
    Creating filesystem with 25600 4k blocks and 25600 inodes  

    Allocating group tables: done                              
    Writing inode tables: done                              
    Creating journal (1024 blocks): done  
    Writing superblocks and filesystem accounting information: done  

12. root@vagrant:/home/vagrant# lsblk  
    NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT  
    sda                    8:0    0   64G  0 disk    
    ├─sda1                 8:1    0  512M  0 part  /boot/efi  
    ├─sda2                 8:2    0    1K  0 part    
    └─sda5                 8:5    0 63.5G  0 part    
    ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /  
    └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]  
    sdb                    8:16   0  2.5G  0 disk    
    ├─sdb1                 8:17   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    └─sdb2                 8:18   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0   
        └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  
    sdc                    8:32   0  2.5G  0 disk    
    ├─sdc1                 8:33   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    └─sdc2                 8:34   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0   
        └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  

13. /tmp/new/test.gz.                  100%[================================================================>]  21.52M  43.1MB/s    in 0.5s  
    
14. root@vagrant:/home/vagrant# lsblk  
    NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT  
    sda                    8:0    0   64G  0 disk    
    ├─sda1                 8:1    0  512M  0 part  /boot/efi  
    ├─sda2                 8:2    0    1K  0 part    
    └─sda5                 8:5    0 63.5G  0 part    
    ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /  
    └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]  
    sdb                    8:16   0  2.5G  0 disk    
    ├─sdb1                 8:17   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    └─sdb2                 8:18   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0   
        └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  
    sdc                    8:32   0  2.5G  0 disk    
    ├─sdc1                 8:33   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    └─sdc2                 8:34   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0   
        └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  

15. root@vagrant:/tmp/new# gzip -t /tmp/new/test.gz.  
    root@vagrant:/tmp/new# echo $?  
    0  

16. root@vagrant:/tmp/new# pvmove /dev/md0 /dev/md1  
    /dev/md0: Moved: 12.00%   
    /dev/md0: Moved: 100.00% 

    root@vagrant:/tmp/new# lsblk  
    NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT  
    sda                    8:0    0   64G  0 disk    
    ├─sda1                 8:1    0  512M  0 part  /boot/efi  
    ├─sda2                 8:2    0    1K  0 part    
    └─sda5                 8:5    0 63.5G  0 part    
    ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /  
    └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]  
    sdb                    8:16   0  2.5G  0 disk    
    ├─sdb1                 8:17   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    │   └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  
    └─sdb2                 8:18   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0   
    sdc                    8:32   0  2.5G  0 disk    
    ├─sdc1                 8:33   0    2G  0 part    
    │ └─md1                9:1    0    2G  0 raid1   
    │   └─volgr-lv1      253:2    0  100M  0 lvm   /tmp/new  
    └─sdc2                 8:34   0  511M  0 part    
    └─md0                9:0    0 1018M  0 raid0    

17. root@vagrant:/tmp/new# mdadm /dev/md1 --fail /dev/sdb1  
    mdadm: set /dev/sdb1 faulty in /dev/md1  

18. [ 9638.962902] md/raid1:md1: Disk failure on sdb1, disabling device.  
               md/raid1:md1: Operation continuing on 1 devices.  

19. root@vagrant:/tmp/new# gzip -t /tmp/new/test.gz.  
    root@vagrant:/tmp/new# echo $?  
    0  

20. k0pec@k0pec-ub:~/netology_devops/3.1_Terminal_1/vagrant$ vagrant destroy -f  
    ==> default: Forcing shutdown of VM...  
    ==> default: Destroying VM and associated drives...  














