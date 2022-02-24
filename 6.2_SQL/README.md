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
   