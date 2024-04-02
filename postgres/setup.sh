#!/bin/bash
#sudo locale-gen en_US.UTF-8
#LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
if [ -d .tmp ]; then
    if [ -S .s.PGSQL.5432.lock ]; then
        echo "Socket file already exists. Skipping start."
    else
        echo "Starting PostgreSQL..."
        pg_ctl -D .tmp/postgres -l logfile -o "--unix_socket_directories='$PWD' --listen_addresses='localhost'" start
    fi
else
    echo "Initializing PostgreSQL..."
    initdb -D .tmp/postgres
    sleep 2
    echo "Starting PostgreSQL..."
    pg_ctl -D .tmp/postgres -l logfile -o "--unix_socket_directories='$PWD' --listen_addresses='localhost'" start
fi

if ! psql -h localhost -lqt | cut -d \| -f 1 | grep -qw postgres; then
    echo "Creating database..."
    createdb -h localhost postgres
else
    echo "Database already exists. Skipping creation."
fi

if psql -h localhost -tAc "SELECT 1 FROM pg_roles WHERE rolname='postgres'" >/dev/null 2>&1; then
    echo "User already exists. Skipping creation."
else
    echo "Creating user..."
    createuser -h localhost -s postgres
fi
