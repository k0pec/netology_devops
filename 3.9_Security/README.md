# 3.9 Security
## Home Work
1.  ![bitwarden](https://github.com/k0pec/netology_devops/tree/main/3.9_Security/bitwarden.png)  
   
2.  ![bitwarden_2FA](https://github.com/k0pec/netology_devops/tree/main/3.9_Security/bitwarden_2FA.png)  

3.  Vagrant.configure("2") do |config|  
        config.vm.box = "bento/ubuntu-20.04"  
        config.vm.network "forwarded_port", guest: 80, host: 8080  
        config.vm.network "forwarded_port", guest: 443, host: 4443 
    end  

    ![apache2-ssl](https://github.com/k0pec/netology_devops/tree/main/3.9_Security/apache2-ssl.png) 


4. k0pec@k0pec-ub:~/testssl/testssl.sh$ ./testssl.sh -U --sneaky https://yandex.ru  

    ###########################################################  
        testssl.sh       3.1dev from https://testssl.sh/dev/  
        (6da72bc 2021-12-10 20:16:28 -- )  

          This program is free software. Distribution and  
                 modification under GPLv2 permitted.  
          USAGE w/o ANY WARRANTY. USE IT AT YOUR OWN RISK!  

           Please file bugs @ https://testssl.sh/bugs/  

    ###########################################################  

     Using "OpenSSL 1.0.2-chacha (1.0.2k-dev)" [~183 ciphers]  
     on k0pec-ub:./bin/openssl.Linux.x86_64  
     (built: "Jan 18 17:12:17 2019", platform: "linux-x86_64")  


    Testing all IPv4 addresses (port 443): 5.255.255.88 5.255.255.80 77.88.55.88 77.88.55.77  
    ---------------------------------------------------------------------------------------------  
     Start 2021-12-11 01:37:46        -->> 5.255.255.88:443 (yandex.ru) <<--  

     Further IP addresses:   5.255.255.80 77.88.55.88 77.88.55.77 2a02:6b8:a::a   
     rDNS (5.255.255.88):    yandex.ru.  
     Service detected:       HTTP  


     Testing vulnerabilities   

     Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension  
     CCS (CVE-2014-0224)                       not vulnerable (OK)  
     Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK)  
     ROBOT                                     not vulnerable (OK)  
     Secure Renegotiation (RFC 5746)           supported (OK)  
     Secure Client-Initiated Renegotiation     not vulnerable (OK)  
     CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)  
     BREACH (CVE-2013-3587)                    potentially NOT ok, "br gzip deflate" HTTP compression detected. - only supplied "/" tested  
                                               Can be ignored for static pages or if no secrets in the page  
     POODLE, SSL (CVE-2014-3566)               not vulnerable (OK)  
     TLS_FALLBACK_SCSV (RFC 7507)              Downgrade attack prevention supported (OK)  
     SWEET32 (CVE-2016-2183, CVE-2016-6329)    VULNERABLE, uses 64 bit block ciphers  
     FREAK (CVE-2015-0204)                     not vulnerable (OK)  
     DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)  
                                               make sure you don't use this certificate elsewhere with SSLv2 enabled services  
                                               https://censys.io/ipv4?q=26EB381642B07A05F7CA935101FC6492F91F7F0721995A8E577EDFB6723EBD1F could help you to find out  
     LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no DH key detected with <= TLS 1.2  
     BEAST (CVE-2011-3389)                     TLS1: ECDHE-RSA-AES128-SHA AES128-SHA DES-CBC3-SHA 
                                               VULNERABLE -- but also supports higher protocols  TLSv1.1 TLSv1.2 (likely mitigated)  
     LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches  
     Winshock (CVE-2014-6321), experimental    not vulnerable (OK)  
     RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)  

5.  1.  To server:  
        useradd -m mysshfriend  
        usermod -a -G sudo mysshfriend  
        passwd mysshfriend  
        nano /etc/ssh/sshd_config  
        uncomment:  
            Port 22  
            ListenAddress 192.168.56.101  
            PubkeyAutentikation yes  
            AuthorizedKeysFile .ssh/authorized_keys  
            PasswordAuthentication yes  
    1.  To client:  
        cd ~/.ssh  
        ssh-keygen -t rsa  
        cd ..   
        ssh-copy-id -i .ssh/ubuntu-test.pub mysshfriend@192.168.56.101    
        /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: ".ssh/ubuntu-test.pub"    
        /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed    
        /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys  
        mysshfriend@192.168.56.101's password:     

        Number of key(s) added: 1    

        Now try logging into the machine, with:   "ssh 'mysshfriend@192.168.56.101'"    
        and check to make sure that only the key(s) you wanted were added.    

        ssh mysshfriend@192.168.56.101  
        Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-41-generic x86_64)  

        * Documentation:  https://help.ubuntu.com  
        * Management:     https://landscape.canonical.com  
        * Support:        https://ubuntu.com/advantage  

        130 updates can be applied immediately.  
        60 of these updates are standard security updates.  
        To see these additional updates run: apt list --upgradable  

        Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings  

        Your Hardware Enablement Stack (HWE) is supported until April 2025.  
        Last login: Mon Dec  6 02:20:27 2021 from 192.168.56.99  
        $ exit  
        Connection to 192.168.56.101 closed.  

6.  k0pec@k0pec-ub:~$ cat .ssh/config
    Host ubuntu-test
    HostName 192.168.56.101
    IdentityFile ~/.ssh/ubuntu-test
    User mysshfriend
    Protocol 2

        
7.  k0pec@k0pec-ub:~/netology_devops$ sudo tcpdump -c 100 -w tcpdump_eno1.pcap -i eno1  
    tcpdump: listening on eno1, link-type EN10MB (Ethernet), capture size 262144 bytes  
    100 packets captured  
    397 packets received by filter  
    0 packets dropped by kernel  

    ![wireshark](https://github.com/k0pec/netology_devops/tree/main/3.9_Security/wireshark.png) 
