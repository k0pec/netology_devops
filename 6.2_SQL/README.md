# 6.2 SQL
## Home Work
1.  ***Task 1***  
  ```yml
  ---
    version: "3"
    services:
        postgres:
            image: postgres:12
            volumes:
            - ./db:/data/db
            - ./back:/data/back
            tty: true
            restart: always
            environment:
                POSTGRES_PASSWORD: example
                PGDATA: /data/db
  ```
2. ***Task 2***  
   ```bash
      test_db-> \l
                                        List of databases
      Name    |  Owner   | Encoding |  Collate   |   Ctype    |      Access privileges       
    -----------+----------+----------+------------+------------+------------------------------
    postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
    template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                 +
              |          |          |            |            | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                 +
              |          |          |            |            | postgres=CTc/postgres
    test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/postgres                +
              |          |          |            |            | postgres=CTc/postgres       +
              |          |          |            |            | test_admin_user=CTc/postgres
    (4 rows)
   ```
   ```bash
      test_db=# \d
                      List of relations
    Schema |      Name      |   Type   |      Owner      
    --------+----------------+----------+-----------------
    public | clients        | table    | test_admin_user
    public | clients_id_seq | sequence | test_admin_user
    public | orders         | table    | test_admin_user
    public | orders_id_seq  | sequence | test_admin_user

   ```
   ```bash
          test_db=# select * from information_schema.table_privileges where grantee='test_simple_user' limit 10;
        grantor     |     grantee      | table_catalog | table_schema | table_name | privilege_type | is_gra
    ntable | with_hierarchy 
    -----------------+------------------+---------------+--------------+------------+----------------+-------
    -------+----------------
    test_admin_user | test_simple_user | test_db       | public       | clients    | INSERT         | NO    
          | NO
    test_admin_user | test_simple_user | test_db       | public       | clients    | SELECT         | NO    
          | YES
    test_admin_user | test_simple_user | test_db       | public       | clients    | UPDATE         | NO    
          | NO
    test_admin_user | test_simple_user | test_db       | public       | clients    | DELETE         | NO    
          | NO
    test_admin_user | test_simple_user | test_db       | public       | orders     | INSERT         | NO    
          | NO
    test_admin_user | test_simple_user | test_db       | public       | orders     | SELECT         | NO    
          | YES
    test_admin_user | test_simple_user | test_db       | public       | orders     | UPDATE         | NO    
          | NO
    test_admin_user | test_simple_user | test_db       | public       | orders     | DELETE         | NO    
          | NO
    (8 rows)
   ```
3. ***Task 3***  
  ```bash
      root@9cdd79611618:/# psql --username test_admin_user --dbname test_db
    psql (12.10 (Debian 12.10-1.pgdg110+1))
    Type "help" for help.

    test_db=> INSERT INTO orders (name, price) VALUES ('Шоколад', 10);
    INSERT 0 1
    test_db=> INSERT INTO orders (name, price) VALUES ('Принтер', 3000);
    INSERT 0 1
    test_db=> INSERT INTO orders (name, price) VALUES ('Книга', 500);
    INSERT 0 1
    test_db=> INSERT INTO orders (name, price) VALUES ('Монитор', 7000);
    INSERT 0 1
    test_db=> INSERT INTO orders (name, price) VALUES ('Гитара', 4000);
    INSERT 0 1
    test_db=> select * from orders
    test_db-> ;
    id |  name   | price 
    ----+---------+-------
      1 | Шоколад |    10
      2 | Принтер |  3000
      3 | Книга   |   500
      4 | Монитор |  7000
      5 | Гитара  |  4000
    (5 rows)

    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Иванов Иван Иванович', USA);
    ERROR:  column "usa" does not exist
    LINE 1: ... country_of_residence) VALUES ('Иванов Иван Иванович', USA);
                                                                      ^
    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Иванов Иван Иванович', 'USA');
    INSERT 0 1
    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Петров Петр Петрович', 'Canada');INSERT 0 1
    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Иоган Себастьян Бах', 'Japan');
    INSERT 0 1
    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Ронни Джеймс Дио', 'Russia');
    INSERT 0 1
    test_db=> INSERT INTO clients (lastname, country_of_residence) VALUES ('Ritchie Blackmore', 'Russia');
    INSERT 0 1
    test_db=> select * from clients;                                                               
    id |       lastname       | country_of_residence | order_of_client 
    ----+----------------------+----------------------+-----------------
      1 | Иванов Иван Иванович | USA                  |                
      2 | Петров Петр Петрович | Canada               |                
      3 | Иоган Себастьян Бах  | Japan                |                
      4 | Ронни Джеймс Дио     | Russia               |                
      5 | Ritchie Blackmore    | Russia               |                
    (5 rows)
    test_db=> select count(*) from orders;
      count 
      -------
          5
      (1 row)

      test_db=> select count(*) from clients;
      count 
      -------
          5
      (1 row)

    test_db=> 

  ```
4. ***Task 4***
  ```bash
      test_db=> UPDATE clients SET order_of_clients=3 WHERE lastname='Иванов Иван Иванович';
    ERROR:  column "order_of_clients" of relation "clients" does not exist
    LINE 1: UPDATE clients SET order_of_clients=3 WHERE lastname='Иванов...
                              ^
    test_db=> UPDATE clients SET order_of_client=3 WHERE lastname='Иванов Иван Иванович';
    UPDATE 1
    test_db=> UPDATE clients SET order_of_client=4 WHERE lastname='Петров Петр Петрович';
    UPDATE 1
    test_db=> UPDATE clients SET order_of_client=5 WHERE lastname='Иоган Себастьян Бах';
    UPDATE 1
    test_db=> select * from clients;
    id |       lastname       | country_of_residence | order_of_client 
    ----+----------------------+----------------------+-----------------
      4 | Ронни Джеймс Дио     | Russia               |                
      5 | Ritchie Blackmore    | Russia               |                
      1 | Иванов Иван Иванович | USA                  |               3
      2 | Петров Петр Петрович | Canada               |               4
      3 | Иоган Себастьян Бах  | Japan                |               5
    (5 rows)

    test_db=> select lastname from clients where order_of_client in (select id from orders);
          lastname       
    ----------------------
    Иванов Иван Иванович
    Петров Петр Петрович
    Иоган Себастьян Бах
    (3 rows)
  ```
5. ***Task 5***
  ```bash
      test_db=> explain select lastname from clients where order_of_client in (select id from orders);
                                  QUERY PLAN                               
    -----------------------------------------------------------------------
    Hash Join  (cost=12.03..26.50 rows=90 width=274)
      Hash Cond: (orders.id = clients.order_of_client)
      ->  Seq Scan on orders  (cost=0.00..12.60 rows=260 width=4)
      ->  Hash  (cost=10.90..10.90 rows=90 width=278)
            ->  Seq Scan on clients  (cost=0.00..10.90 rows=90 width=278)
    (5 rows)

  ```  
  EXPLAIN отоброжает приблизительную стоимость запуска (т.е. время выбрки), приблизительную общую стоимость запуска (т.е. время полного выполнения запроса с чтением строк дочернего узла до конца, если не указаны лимиты и прочие условия), ожидаемое число строк, ожидаемый средний размер строки.

6.  ***Task 6***
  ```bash
      root@9cdd79611618:/# pg_dump -U postgres -d test_db > /data/back/test_db.back     
    root@9cdd79611618:/# ls -l /data/back
    total 8
    -rw-r--r-- 1 root root 4505 Feb 23 13:13 test_db.back

  ```
  ```bash
      root@53ca3e57ca84:/# ls -l /data/back/' '
    total 8
    -rw-r--r-- 1 root root 4505 Feb 23 13:13 test_db.back
    root@53ca3e57ca84:/# cd /data/back/' '
    root@53ca3e57ca84:/data/back/ # psql --username postgres
    psql (12.10 (Debian 12.10-1.pgdg110+1))
    Type "help" for help.

    postgres=# \l
                                    List of databases
      Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
    -----------+----------+----------+------------+------------+-----------------------
    postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
    template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    (3 rows)
    root@53ca3e57ca84:/data/back/ # psql --username postgres
    psql (12.10 (Debian 12.10-1.pgdg110+1))
    Type "help" for help.

    postgres=# create database test_db;
    CREATE DATABASE
    postgres=# exit
    root@53ca3e57ca84:/data/back/ # psql --username postgres test_db < test_db.back

      postgres=# \l
                                        List of databases
      Name    |  Owner   | Encoding |  Collate   |   Ctype    |      Access privileges       
    -----------+----------+----------+------------+------------+------------------------------
    postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
    template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                 +
              |          |          |            |            | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                 +
              |          |          |            |            | postgres=CTc/postgres
    test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/postgres                +
              |          |          |            |            | postgres=CTc/postgres       +
              |          |          |            |            | test_admin_user=CTc/postgres
    (4 rows)

  ```

