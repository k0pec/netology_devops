#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    CREATE USER test_admin_user;
    CREATE USER test_simple_user;
    CREATE DATABASE test_db;
    GRANT ALL PRIVILEGES ON DATABASE test_db TO test-admin-user;
    EXIT;
EOSQL
psql -v ON_ERROR_STOP=1 --username test_admin_user --dbname test_db <<-EOSQL
    CREATE TABLE orders (
        id serial primary key, 
        name varchar(128), 
        price integer
    );
    CREATE TABLE clients (
        id serial primary key, 
        lastname varchar(128), 
        country_of_residence varchar(255), 
        order_of_client integer references orders (id)
    );
    CREATE INDEX on clients (country_of_residenceu
    EXIT;
EOSQL
psql -v ON_ERROR_STOP=1 --username postgres --dbname test_db <<-EOSQL
    GRANT SELECT,INSERT,UPDATE,DELETE on clients,orders to test_simple_user;
    EXIT;
EOSQL