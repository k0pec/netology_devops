# 6.4 PostgreSQL
## Home Work
+   ***Task 1***
    ```yml
        version: "3"
        services:
        postgres:
            image: postgres:13
            volumes:
            - ./db/   :/data/db/
            - ./back/ :/data/back/
            tty: true
            restart: always
            environment:
            POSTGRES_PASSWORD: example
            PGDATA: /data/db
    ```
    - список баз   
        ``\l``;  
    - подключения к БД   
        ``\c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}``;  
    - вывод списка таблиц   
        ``\dtS``
    - вывода описания содержимого таблиц  
        ``\dS+ <table>``   
    - выхода из psql  
        ``\q``
+   ***Task 2***
    ```bash
        root@bca3bfe7623f:/data# psql --username postgres test_database < /data/back/test_dump.sql
    ```
    ```bash
        test_database=# analyze verbose public.orders;
        INFO:  analyzing "public.orders"
        INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
        ANALYZE
    ```
    ```bash
        test_database=# select avg_width from pg_stats where tablename='orders';
        avg_width 
        -----------
                4
                16
                4
        (3 rows)
    ```
+   ***Task 3***
    ```sql
        BEGIN;
        ALTER TABLE orders RENAME TO orders_simple;
        CREATE TABLE orders (id integer, title varchar(80), price integer) PARTITION BY range(price);
        CREATE TABLE orders_less499 PARTITION OF orders FOR values FROM (0) to (499);
        CREATE TABLE orders_more499 PARTITION OF orders FOR values FROM (499) to (999999999);
        INSERT INTO orders (id, title, price) SELECT * FROM orders_simple;
        DROP TABLE orders_simple;
        COMMIT;
    ```
    При проектировании можно было изначально таблицу orders сделать шардированной.

+   ***Task 4***
    ```bash
        root@bca3bfe7623f:/data# pg_dump -U postgres -d test_database > /data/back/test_database_dump.sql
    ```
    Для уникальности можно добавить индекс или первичный ключ.
    ```sql
    CREATE INDEX ON orders ((lower(title)));
    ```


    