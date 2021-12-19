##!/usr/bin/env python3

import socket as s
import time as t
import json
import yaml

wait = 2
srv = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}

while 1==1 :
  
  for host in srv:
    ip = s.gethostbyname(host)
    if ip != srv[host]:
        print(str('[ERROR] ' + str(host) + ' IP mistmatch: ' + srv[host] + ' ' + ip))
    srv[host]=ip
  
    with open("srv.json",'w') as jsf:
      json_data= json.dumps(srv)
      jsf.write(json_data)
    with open("srv.yaml",'w') as ymf:
      yaml_data= yaml.dump(srv)
      ymf.write(yaml_data)
  t.sleep(wait)