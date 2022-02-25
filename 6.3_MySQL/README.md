# 6.3 MySQL
## Home Work
+ ***Task 1*** 
    ```yml
        version: '3.1'
        services:
        db:
            image: mysql
            command: --default-authentication-plugin=mysql_native_password
            restart: always
            environment:
                MYSQL_ROOT_PASSWORD: example
            volumes: 
              - ./db/   :/var/lib/mysql
              - ./back/ :/home/back
    ```
    ```bash
        root@k0pec-ub:/home/k0pec/netology_devops/6.3_MySQL# docker-compose up -d
        Creating 63_mysql_db_1 ... done
        root@k0pec-ub:/home/k0pec/netology_devops/6.3_MySQL# docker ps
        CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                 NAMES
        aa4451dafa37   mysql     "docker-entrypoint.s…"   11 seconds ago   Up 10 seconds   3306/tcp, 33060/tcp   63_mysql_db_1
        root@k0pec-ub:/home/k0pec/netology_devops/6.3_MySQL# docker exec -i -t aa4451dafa37 bash
        root@aa4451dafa37:/# mysql -uroot -p
    ```
    ```bash
        mysql> CREATE DATABASE db DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
        Query OK, 1 row affected, 2 warnings (0.02 sec)
    ```
    ```bash
        root@aa4451dafa37:/home/back# mysql -uroot -p db < test_dump.sql
    ```
    ```bash        
        mysql> SHOW DATABASEs;
        +--------------------+
        | Database           |
        +--------------------+
        | db                 |
        | information_schema |
        | mysql              |
        | performance_schema |
        | sys                |
        +--------------------+
        5 rows in set (0.00 sec)

        mysql> USE db;
        Reading table information for completion of table and column names
        You can turn off this feature to get a quicker startup with -A

        Database changed
        mysql> SHOW TABLES;
        +--------------+
        | Tables_in_db |
        +--------------+
        | orders       |
        +--------------+
        1 row in set (0.00 sec)

        mysql> SELECT * FROM orders;
        +----+-----------------------+-------+
        | id | title                 | price |
        +----+-----------------------+-------+
        |  1 | War and Peace         |   100 |
        |  2 | My little pony        |   500 |
        |  3 | Adventure mysql times |   300 |
        |  4 | Server gravity falls  |   300 |
        |  5 | Log gossips           |   123 |
        +----+-----------------------+-------+
        5 rows in set (0.00 sec)
    ```
    ```bash
        mysql> \s
        --------------
        mysql  Ver 8.0.28 for Linux on x86_64 (MySQL Community Server - GPL)

        Connection id:          10
        Current database:       db
        Current user:           root@localhost
        SSL:                    Not in use
        Current pager:          stdout
        Using outfile:          ''
        Using delimiter:        ;
        Server version:         8.0.28 MySQL Community Server - GPL
        Protocol version:       10
        Connection:             Localhost via UNIX socket
        Server characterset:    utf8mb4
        Db     characterset:    utf8mb3
        Client characterset:    latin1
        Conn.  characterset:    latin1
        UNIX socket:            /var/run/mysqld/mysqld.sock
        Binary data as:         Hexadecimal
        Uptime:                 9 min 34 sec

        Threads: 2  Questions: 48  Slow queries: 0  Opens: 161  Flush tables: 3  Open tables: 79  Queries per second avg: 0.083
        --------------
    ```
    ```bash
        mysql> SELECT * FROM orders WHERE price>300;
        +----+----------------+-------+
        | id | title          | price |
        +----+----------------+-------+
        |  2 | My little pony |   500 |
        +----+----------------+-------+
        1 row in set (0.00 sec)

        mysql> SELECT COUNT(*) FROM orders WHERE price>300;
        +----------+
        | COUNT(*) |
        +----------+
        |        1 |
        +----------+
        1 row in set (0.00 sec)
    ```
+   ***Task 2***
    ```bash
        mysql> create user 'test'@'localhost' identified with mysql_native_password by 'test-pass';
        Query OK, 0 rows affected (0.02 sec)
    ```
    ```bash
        mysql> ALTER USER 'test'@'localhost' PASSWORD EXPIRE INTERVAL 180 DAY FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;
        Query OK, 0 rows affected (0.01 sec)
    ```
    ```bash
        ALTER USER 'test'@'localhost' ATTRIBUTE '{"fname":"James", "lname":"Pretty"}';
        Query OK, 0 rows affected (0.00 sec)
    ```
    ```bash
        mysql> GRANT Select ON db.orders TO 'test'@'localhost';
        Query OK, 0 rows affected, 1 warning (0.01 sec)
    ```
    ```bash
        mysql> SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE USER='test';
        +------+-----------+---------------------------------------+
        | USER | HOST      | ATTRIBUTE                             |
        +------+-----------+---------------------------------------+
        | test | localhost | {"fname": "James", "lname": "Pretty"} |
        +------+-----------+---------------------------------------+
        1 row in set (0.00 sec)
    ```
+   ***Task 3***
    ```bash
        mysql> SET profiling = 1;
        Query OK, 0 rows affected, 1 warning (0.00 sec)
    ```
    ```bash
        mysql> SELECT TABLE_NAME,ENGINE,ROW_FORMAT,TABLE_ROWS,DATA_LENGTH,INDEX_LENGTH FROM information_schema.TABLES WHERE table_name = 'orders' and  TABLE_SCHEMA = 'db' ORDER BY ENGINE asc;
        +------------+--------+------------+------------+-------------+--------------+
        | TABLE_NAME | ENGINE | ROW_FORMAT | TABLE_ROWS | DATA_LENGTH | INDEX_LENGTH |
        +------------+--------+------------+------------+-------------+--------------+
        | orders     | InnoDB | Dynamic    |          5 |       16384 |            0 |
        +------------+--------+------------+------------+-------------+--------------+
        1 row in set (0.01 sec)
    ```
    ```bash
        mysql> ALTER TABLE orders ENGINE = InnoDB;
        Query OK, 0 rows affected (0.06 sec)
        Records: 0  Duplicates: 0  Warnings: 0
        mysql> ALTER TABLE orders ENGINE = MyISAM;
        Query OK, 5 rows affected (0.03 sec)
        Records: 5  Duplicates: 0  Warnings: 0

        mysql> show profiles;
        +----------+------------+------------------------------------+
        | Query_ID | Duration   | Query                              |
        +----------+------------+------------------------------------+
        |        1 | 0.00017050 | ALTER TABLE orders ENGINE = MyISAM |
        |        2 | 0.00037275 | SELECT DATABASE()                  |
        |        3 | 0.00051875 | show databases                     |
        |        4 | 0.00054800 | show tables                        |
        |        5 | 0.06204550 | ALTER TABLE orders ENGINE = InnoDB |
        |        6 | 0.03363350 | ALTER TABLE orders ENGINE = MyISAM |
        +----------+------------+------------------------------------+
        6 rows in set, 1 warning (0.00 sec)
    ```
+   ***Task 4***
    ```bash
        [mysqld]
        pid-file        = /var/run/mysqld/mysqld.pid
        socket          = /var/run/mysqld/mysqld.sock
        datadir         = /var/lib/mysql
        secure-file-priv= NULL

        # Custom config should go here
        !includedir /etc/mysql/conf.d/
        innodb_flush_log_at_trx_commit = 0
        innodb_file_format=Barracuda
        innodb_log_buffer_size= 1M
        key_buffer_size = 640М
        max_binlog_size= 100M
    ```