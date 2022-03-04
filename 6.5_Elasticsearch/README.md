# 6.5 Elasticsearch
## Home Work
+   **``Task 1``**  
    ```docker
        FROM centos:7
        LABEL elasticsearch hw_6.5
        ENV PATH=/usr/lib:/usr/lib/jvm/jre-11/bin:$PATH

        RUN yum install java-11-openjdk -y 
        RUN yum install wget -y 

        RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz \
            && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512
        RUN yum install perl-Digest-SHA -y 
        RUN shasum -a 512 -c elasticsearch-8.0.1-linux-x86_64.tar.gz.sha512 \ 
            && tar -xzf elasticsearch-8.0.1-linux-x86_64.tar.gz \
            && yum upgrade -y
            
        ADD elasticsearch.yml /elasticsearch-8.0.1/config/
        ENV JAVA_HOME=/elasticsearch-8.0.1/jdk/
        ENV ES_HOME=/elasticsearch-8.0.1
        RUN groupadd elasticsearch \
            && useradd -g elasticsearch elasticsearch
            
        RUN mkdir /var/lib/logs \
            && chown elasticsearch:elasticsearch /var/lib/logs \
            && mkdir /var/lib/data \
            && chown elasticsearch:elasticsearch /var/lib/data \
            && chown -R elasticsearch:elasticsearch /elasticsearch-8.0.1/
        RUN mkdir /elasticsearch-8.0.1/snapshots &&\
            chown elasticsearch:elasticsearch /elasticsearch-8.0.1/snapshots
            
        USER elasticsearch
        CMD ["/usr/sbin/init", "/elasticsearch-8.0.1/bin/elasticsearch"]

    ```
    ```json
        {
        "name" : "688a55046345",
        "cluster_name" : "netology_test",
        "cluster_uuid" : "AmmFKIsjR92faDnA484tTg",
        "version" : {
            "number" : "8.0.1",
            "build_flavor" : "default",
            "build_type" : "tar",
            "build_hash" : "ff17057114c2199c9c1bbecc727003a907c0db7a",
            "build_date" : "2022-03-2T19:44:09.394032Z",
            "build_snapshot" : false,
            "lucene_version" : "9.0.0",
            "minimum_wire_compatibility_version" : "6.8.0",
            "minimum_index_compatibility_version" : "6.0.0-beta1"
        },
        "tagline" : "You Know, for Search"
        }
    ```
    - [konstantinpe4enkin](https://hub.docker.com/repository/docker/konstantinpe4enkin/es)
  
+   **``Task 2``**
    ```bash
        curl -X PUT localhost:9200/ind-1 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 1,  "number_of_replicas": 0 }}'
        curl -X PUT localhost:9200/ind-2 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 2,  "number_of_replicas": 1 }}'
        curl -X PUT localhost:9200/ind-3 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 4,  "number_of_replicas": 2 }}' 
    ``` 
    ```bash
       curl -X GET 'http://localhost:9200/_cat/indices?v' 
        health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
        green  open   ind-1 X73-zydeSZSJPdb6C1BZqQ   1   0          0            0       208b           208b
        yellow open   ind-3 3a13bPmBSOODzEgVNj4b1Q   4   2          0            0       832b           832b
        yellow open   ind-2 X3sOYZS9SmmKEsYTin-4Ig   2   1          0            0       416b           416b 
    ```   
    ```json
        curl -X GET 'http://localhost:9200/_cluster/health/ind-1?pretty' 
        {
        "cluster_name" : "netology_test",
        "status" : "green",
        "timed_out" : false,
        "number_of_nodes" : 1,
        "number_of_data_nodes" : 1,
        "active_primary_shards" : 1,
        "active_shards" : 1,
        "relocating_shards" : 0,
        "initializing_shards" : 0,
        "unassigned_shards" : 0,
        "delayed_unassigned_shards" : 0,
        "number_of_pending_tasks" : 0,
        "number_of_in_flight_fetch" : 0,
        "task_max_waiting_in_queue_millis" : 0,
        "active_shards_percent_as_number" : 100.0
        }

        $ curl -X GET 'http://localhost:9200/_cluster/health/ind-2?pretty' 
        {
        "cluster_name" : "netology_test",
        "status" : "yellow",
        "timed_out" : false,
        "number_of_nodes" : 1,
        "number_of_data_nodes" : 1,
        "active_primary_shards" : 2,
        "active_shards" : 2,
        "relocating_shards" : 0,
        "initializing_shards" : 0,
        "unassigned_shards" : 2,
        "delayed_unassigned_shards" : 0,
        "number_of_pending_tasks" : 0,
        "number_of_in_flight_fetch" : 0,
        "task_max_waiting_in_queue_millis" : 0,
        "active_shards_percent_as_number" : 41.17647058823529
        }

        $ curl -X GET 'http://localhost:9200/_cluster/health/ind-3?pretty' 
        {
        "cluster_name" : "netology_test",
        "status" : "yellow",
        "timed_out" : false,
        "number_of_nodes" : 1,
        "number_of_data_nodes" : 1,
        "active_primary_shards" : 4,
        "active_shards" : 4,
        "relocating_shards" : 0,
        "initializing_shards" : 0,
        "unassigned_shards" : 8,
        "delayed_unassigned_shards" : 0,
        "number_of_pending_tasks" : 0,
        "number_of_in_flight_fetch" : 0,
        "task_max_waiting_in_queue_millis" : 0,
        "active_shards_percent_as_number" : 41.17647058823529
        }
    ```
    ```json
        curl -XGET localhost:9200/_cluster/health/?pretty=true
        {
        "cluster_name" : "netology_test",
        "status" : "yellow",
        "timed_out" : false,
        "number_of_nodes" : 1,
        "number_of_data_nodes" : 1,
        "active_primary_shards" : 7,
        "active_shards" : 7,
        "relocating_shards" : 0,
        "initializing_shards" : 0,
        "unassigned_shards" : 10,
        "delayed_unassigned_shards" : 0,
        "number_of_pending_tasks" : 0,
        "number_of_in_flight_fetch" : 0,
        "task_max_waiting_in_queue_millis" : 0,
        "active_shards_percent_as_number" : 41.17647058823529
        }
    ```
    ```bash
        curl -X DELETE 'http://localhost:9200/ind-1?pretty' 
        {
        "acknowledged" : true
        }
        $ curl -X DELETE 'http://localhost:9200/ind-2?pretty' 
        {
        "acknowledged" : true
        }
        $ curl -X DELETE 'http://localhost:9200/ind-3?pretty' 
        {
        "acknowledged" : true
        }
        $ curl -X GET 'http://localhost:9200/_cat/indices?v'
        health status index uuid pri rep docs.count docs.deleted store.size pri.store.size

    ```
    - индексы в статусе ``yellow`` потому что у них указано число реплик, а по факту нет других серверов, соответсвено реплицировать некуда

+   **``Task 3``**
    ```bash
        $ curl -XPOST localhost:9200/_snapshot/netology_backup?pretty -H 'Content-Type: application/json' -d'{"type": "fs", "settings": { "location":"/usr/share/elasticsearch/snapshots" }}'
        {
        "acknowledged" : true
        }
    ```

    - результат: http://localhost:9200/_snapshot/netology_backup?pretty
  
    ```json
        {
        "netology_backup" : {
            "type" : "fs",
            "settings" : {
            "location" : "/usr/share/elasticsearch/snapshots"
            }
        }
        }
    ```
    ```bash
        curl -X PUT localhost:9200/test -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 1,  "number_of_replicas": 0 }}'
        {"acknowledged":true,"shards_acknowledged":true,"index":"test"}1
    ```

    - результат: http://localhost:9200/test?pretty
    
    ```json
        {
        "test" : {
            "aliases" : { },
            "mappings" : { },
            "settings" : {
            "index" : {
                "routing" : {
                "allocation" : {
                    "include" : {
                    "_tier_preference" : "data_content"
                    }
                }
                },
                "number_of_shards" : "1",
                "provided_name" : "test",
                "creation_date" : "1615033116650",
                "number_of_replicas" : "0",
                "uuid" : "P1duHjRTQBacJyWPGeNwUQ",
                "version" : {
                "created" : "7110199"
                }
            }
            }
        }
        }
    ```
    ```bash
        $ curl -X PUT localhost:9200/_snapshot/netology_backup/elasticsearch?wait_for_completion=true
    ```
    ```json
        {"snapshot":{"snapshot":"elasticsearch","uuid":"wixOT9zMS_WYXlGfNw7nsQ","version_id":80199,"version":"8.0.1","indices":["test"],"data_streams":[],"include_global_state":true,"state":"SUCCESS","start_time":"2022-03-03T12:23:31.388Z","start_time_in_millis":1615033411388,"end_time":"2022-03-03T12:23:31.988Z","end_time_in_millis":1615033411988,"duration_in_millis":600,"failures":[],"shards":{"total":1,"failed":0,"successful":1}}}
    ```
    ```bash
    $ pwd
        /usr/share/elasticsearch/snapshots
    $ ls -la
        total 92
        drwxr-xr-x 3 elasticsearch elasticsearch  4096 Mar  6 12:54 .
        drwxr-xr-x 9 root          root           4096 Mar  6 12:13 ..
        -rw-r--r-- 1 elasticsearch elasticsearch   692 Mar  6 12:54 index-1
        -rw-r--r-- 1 elasticsearch elasticsearch     8 Mar  6 12:54 index.latest
        drwxr-xr-x 3 elasticsearch elasticsearch  4096 Mar  6 12:23 indices
        -rw-r--r-- 1 elasticsearch elasticsearch 30931 Mar  6 12:54 meta-qnkfqjUhTNiyJLt99z-N5Q.dat
        -rw-r--r-- 1 elasticsearch elasticsearch 30931 Mar  6 12:23 meta-wixOT9zMS_WYXlGfNw7nsQ.dat
        -rw-r--r-- 1 elasticsearch elasticsearch   267 Mar  6 12:54 snap-qnkfqjUhTNiyJLt99z-N5Q.dat
        -rw-r--r-- 1 elasticsearch elasticsearch   269 Mar  6 12:23 snap-wixOT9zMS_WYXlGfNw7nsQ.dat
    ``` 

    - Удаление и создание нового индекса:
    ```bash
        health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
        green  open   test  P1duHjRTQBacJyWPGeNwUQ   1   0          0            0       208b           208b
    ```
    ```bash
        $ curl -X DELETE 'http://localhost:9200/test?pretty'
    ```
    ```json
        {
        "acknowledged" : true
        }
    ```
    ```bash
        $ curl -X PUT localhost:9200/test-2?pretty -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 1,  "number_of_replicas": 0 }}'
    ```
    ```json
        {
        "acknowledged" : true,
        "shards_acknowledged" : true,
        "index" : "test-2"
        }
    ```
    ```bash
        health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
        green  open   test-2 Fn96OZ7YTkuk6LfE2cTC6w   1   0          0            0       208b           208b
    ```
    ```bash
        $ curl -X POST localhost:9200/_snapshot/netology_backup/elasticsearch/_restore?pretty -H 'Content-Type: application/json' -d'{"include_global_state":true}'
    ```
    ```json
        {
        "accepted" : true
        }
    ```
    ```bash
        $ curl -X GET http://localhost:9200/_cat/indices?v
        health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
        green  open   test-2 qwS4ntA_RRig2_gBq_w2cg   1   0          0            0       208b           208b
        green  open   test   HzFsM8gwT1WPFxzDLl0Uew   1   0          0            0       208b           208b
    ```
