#!/bin/bash
if [ -d .tmp ]; then
    if [ -S .s.PGSQL.5432.lock ]; then
        echo "Socket file already exists. Skipping start."
    else
        echo "Starting PostgreSQL..."
        pg_ctl -D .tmp/postgres -l logfile -o "--unix_socket_directories='$PWD' --listen_addresses='localhost'" start
    fi
else
    . ./setup.sh
fi
