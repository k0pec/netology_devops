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
2.  ![http]
