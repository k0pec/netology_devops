# 3.8 Net 3
## Home Work
1.  route-views>show ip route 178.141.67.207 255.255.255.255  
    Routing entry for 178.141.0.0/16  
    Known via "bgp 6447", distance 20, metric 0  
    Tag 2497, type external  
    Last update from 202.232.0.2 3d15h ago  
    Routing Descriptor Blocks:  
    * 202.232.0.2, from 202.232.0.2, 3d15h ago  
        Route metric is 0, traffic share count is 1  
        AS Hops 2  
        Route tag 2497  
        MPLS label: none  
          
    route-views>sh bgp 178.141.67.207 255.255.255.255   
    % Network not in table  

2.  vagrant@vagrant:~$ ip -br a  
    lo               UNKNOWN        127.0.0.1/8 ::1/128   
    eth0             UP             10.0.2.15/24 fe80::a00:27ff:fe73:60cf/64   
    dummy0           UNKNOWN        10.2.2.2/32 fe80::9070:cff:fef0:7b0d/64   
  
    vagrant@vagrant:~$ ip route    
    default via 10.0.2.2 dev eth0 proto dhcp src 10.0.2.15 metric 100     
    10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15     
    10.0.2.2 dev eth0 proto dhcp scope link src 10.0.2.15 metric 100     
    192.168.123.0/24 via 10.2.2.2 dev dummy0     
    192.168.124.0/24 via 10.2.2.2 dev dummy0     
  
3.  vagrant@vagrant:~$ ss -t -a -l  
    State           Recv-Q          Send-Q                   Local Address:Port                     Peer Address:Port          Process            
    LISTEN          0               4096                           0.0.0.0:sunrpc                        0.0.0.0:*                                
    LISTEN          0               4096                     127.0.0.53%lo:domain                        0.0.0.0:*                                
    LISTEN          0               128                            0.0.0.0:ssh                           0.0.0.0:*                                
    LISTEN          0               4096                              [::]:sunrpc                           [::]:*                                
    LISTEN          0               128                               [::]:ssh                              [::]:*      
  
    Подключение по  ssh, dns, sunrpc (портмаппинг)  

4.  vagrant@vagrant:~$ ss -u -a -l
    State           Recv-Q          Send-Q                    Local Address:Port                     Peer Address:Port         Process            
    UNCONN          0               0                         127.0.0.53%lo:domain                        0.0.0.0:*                               
    UNCONN          0               0                        10.0.2.15%eth0:bootpc                        0.0.0.0:*                               
    UNCONN          0               0                               0.0.0.0:sunrpc                        0.0.0.0:*                               
    UNCONN          0               0                                  [::]:sunrpc                           [::]:*   

    sunrpc(потмаппинг), bootpc(получение ip-адреса), dns ;

5.  ![homenetwork](https://github.com/k0pec/netology_devops/tree/main/3.8_Net_3/homenetwork.png)


