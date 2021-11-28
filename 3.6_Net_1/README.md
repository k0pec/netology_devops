# 3.6 Net 1
## Home Work
1.  HTTP/1.1 301 Moved Permanently  
    cache-control: no-cache, no-store, must-revalidate  
    location: https://stackoverflow.com/questions  
    x-request-guid: 24acba27-98f5-45bc-b948-3f9e58670b7b  
    feature-policy: microphone 'none'; speaker 'none'  
    content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com  
    Accept-Ranges: bytes  
    Date: Sun, 28 Nov 2021 18:06:22 GMT  
    Via: 1.1 varnish  
    Connection: close  
    X-Served-By: cache-fra19123-FRA  
    X-Cache: MISS  
    X-Cache-Hits: 0  
    X-Timer: S1638122783.742619,VS0,VE92  
    Vary: Fastly-SSL  
    X-DNS-Prefetch-Control: off  
    Set-Cookie: prov=4d002cec-aca1-f4c9-a586-81e11dcf6c57; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly  

    Connection closed by foreign host.  
    Получаем сообщение, что указанный ресурс перемещен на постоянной основе на адрес указанный в location.

2.      
    ![http](https://github.com/k0pec/netology_devops/blob/main/3.6_Net_1/page6.png)  
    ![timing](https://github.com/k0pec/netology_devops/blob/main/3.6_Net_1/page4.png)  
    ![headers](https://github.com/k0pec/netology_devops/blob/main/3.6_Net_1/page3.png)  

3.  k0pec@k0pec-ub:~/netology_devops$ wget -qO- icanhazip.com  
    178.141.153.95  

4.  k0pec@k0pec-ub:~/netology_devops$ whois 178.141.153.95    
    % This is the RIPE Database query service.  
    % The objects are in RPSL format.  
    %  
    % The RIPE Database is subject to Terms and Conditions.  
    % See http://www.ripe.net/db/support/db-terms-conditions.pdf  
  
    % Note: this output has been filtered.  
    %       To receive output for a database update, use the "-B" flag.  

    % Information related to '178.141.152.0 - 178.141.159.255'  

    % Abuse contact for '178.141.152.0 - 178.141.159.255' is 'abuse@mtu.ru'  

    inetnum:        178.141.152.0 - 178.141.159.255  
    netname:        MTS-KRV-PPPOE-24-NET  
    descr:          Mobile Telesystems PJSC, Kirov branch  
    descr:          Dynamic PPPoE individual customers  
    country:        RU  
    admin-c:        NOCK2-RIPE  
    tech-c:         NOCK2-RIPE  
    status:         ASSIGNED PA  
    mnt-by:         VKTV-MNT  
    created:        2013-02-21T08:56:10Z  
    last-modified:  2015-10-05T09:35:08Z  
    source:         RIPE  
  
    role:           Network Operation Center CJSC COMSTAR-Regions Kirov branch  
    address:        101, Karl Marx St., 610027, Kirov, Russia  
    abuse-mailbox:  ITSM_SGP000000039685@mts.ru  
    admin-c:        MC34412-RIPE  
    admin-c:        AP28766-RIPE  
    tech-c:         AP28766-RIPE  
    tech-c:         MC34412-RIPE  
    nic-hdl:        NOCK2-RIPE  
    mnt-by:         VKTV-MNT  
    created:        2013-02-21T06:40:36Z  
    last-modified:  2018-07-12T13:02:48Z  
    source:         RIPE # Filtered  
  
    % Information related to '178.141.0.0/16AS8359'  
  
    route:          178.141.0.0/16  
    descr:          Mobile Telesystems PJSC, Kirov branch  
    origin:         AS8359  
    mnt-by:         MTU-NOC  
    created:        2020-08-12T13:54:25Z  
    last-modified:  2020-08-12T13:54:25Z  
    source:         RIPE  

    % This query was served by the RIPE Database Query Service version 1.101 (HEREFORD) 

5.  k0pec@k0pec-ub:~/netology_devops$ traceroute -A 8.8.8.8  
    traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets  
    1  _gateway (192.168.0.1) [*]  0.469 ms  0.517 ms  0.575 ms  
    2  * 92.39.64.150 (92.39.64.150) [AS8359]  31.302 ms *  
    3  92.39.64.149 (92.39.64.149) [AS8359]  36.874 ms  36.838 ms  37.034 ms  
    4  10.40.248.122 (10.40.248.122) [*]  36.849 ms  37.323 ms  37.315 ms  
    5  kar-cr02-be5.4024.kir.mts-internet.net (195.34.36.16) [AS8359]  37.733 ms  37.724 ms  37.840 ms  
    6  kar-cr01-ae2.43.kir.mts-internet.net (212.188.42.205) [AS8359]  50.519 ms  57.560 ms  56.784 ms  
    7  bek-cr01-be1.43.nnov.mts-internet.net (212.188.54.237) [AS8359]  56.369 ms  56.433 ms  56.273 ms  
    8  mag9-cr02-be3.52.msk.mts-internet.net (212.188.28.169) [AS8359]  56.307 ms  56.261 ms  56.435 ms  
    9  mag9-cr01-be16.77.msk.mts-internet.net (212.188.29.82) [AS8359]  56.333 ms  56.398 ms  56.414 ms  
    10  108.170.250.99 (108.170.250.99) [AS15169]  57.379 ms 108.170.250.34 (108.170.250.34) [AS15169]  57.393 ms 108.170.250.83 (108.170.250.83) [AS15169]  57.436 ms  
    11  * 142.251.49.158 (142.251.49.158) [AS15169]  69.944 ms 209.85.255.136 (209.85.255.136) [AS15169]  72.427 ms  
    12  74.125.253.109 (74.125.253.109) [AS15169]  69.473 ms 108.170.232.251 (108.170.232.251) [AS15169]  73.316 ms 74.125.253.94 (74.125.253.94) [AS15169]  70.001 ms  
    13  216.239.54.201 (216.239.54.201) [AS15169]  70.724 ms 216.239.63.25 (216.239.63.25) [AS15169]  75.231 ms 142.250.209.25 (142.250.209.25) [AS15169]  67.210 ms  
    14  * * *  
    15  * * *  
    16  * * *  
    17  * * *  
    18  * * *  
    19  * * *  
    20  * * *  
    21  * * *  
    22  * * *  
    23  dns.google (8.8.8.8) [AS15169]  103.687 ms  103.643 ms *  

6.  k0pec@k0pec-ub:~/netology_devops$ mtr -rwz 8.8.8.8  
    Start: 2021-11-28T22:39:38+0300  
    HOST: k0pec-ub                                        Loss%   Snt   Last   Avg  Best  Wrst StDev  
    1. AS???    _gateway                                 0.0%    10    0.5   0.4   0.4   0.5   0.0  
    2. AS8359   92.39.64.150                            80.0%    10   70.1  57.4  44.7  70.1  18.0  
    3. AS8359   92.39.64.149                             0.0%    10    6.7   9.8   2.3  20.3   6.3  
    4. AS???    10.40.248.122                            0.0%    10    6.0   9.8   4.5  18.1   5.4  
    5. AS8359   kar-cr02-be5.4024.kir.mts-internet.net   0.0%    10    3.5   8.9   2.9  23.3   6.4  
    6. AS8359   kar-cr01-ae2.43.kir.mts-internet.net     0.0%    10   16.5  20.9  16.0  31.4   5.6  
    7. AS8359   bek-cr01-be1.43.nnov.mts-internet.net    0.0%    10   19.6  21.2  16.1  29.5   5.1  
    8. AS8359   mag9-cr02-be3.52.msk.mts-internet.net    0.0%    10   17.2  23.0  15.8  37.2   7.2  
    9. AS8359   mag9-cr01-be16.77.msk.mts-internet.net   0.0%    10   16.0  23.1  16.0  37.3   6.9  
    10. AS15169  108.170.250.51                           0.0%    10   17.7  26.9  17.7  41.7   7.1  
    11. AS15169  142.251.49.158                          60.0%    10   31.4  36.4  31.4  38.6   3.4  
    12. AS15169  216.239.57.222                           0.0%    10   32.4  36.3  31.6  46.6   4.2  
    13. AS15169  142.250.56.129                           0.0%    10   34.0  37.6  32.0  50.5   5.6  
    14. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    15. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    16. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    17. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    18. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    19. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    20. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    21. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    22. AS???    ???                                     100.0    10    0.0   0.0   0.0   0.0   0.0  
    23. AS15169  dns.google                               0.0%    10   29.0  35.2  28.8  47.7   6.2  

7.  k0pec@k0pec-ub:/netology_devops$ dig dns.google +noall +answer  
    dns.google.		713	IN	A	8.8.4.4  
    dns.google.		713	IN	A	8.8.8.8  

8.  k0pec@k0pec-ub:/netology_devops$ dig -x 8.8.8.8 +noall +answer  
    8.8.8.8.in-addr.arpa.	5408	IN	PTR	dns.google.  
    k0pec@k0pec-ub:~/netology_devops$ dig -x 8.8.4.4 +noall +answer  
    4.4.8.8.in-addr.arpa.	62071	IN	PTR	dns.google.  






 
