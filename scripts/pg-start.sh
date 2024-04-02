#!/bin/bash
function pg-start {
# POSTGRES_USER=${1:-'postgres'}
# POSTGRES_PASSWORD=${2:-'postgres'}
# POSTGRES_DB=${3:-'postgres'}
# docker run \
#     --name postgres \
#     -p 5432:5432 \
#     -e POSTGRES_USER=$POSTGRES_USER \
#     -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
#     -e POSTGRES_DB=$POSTGRES_DB \
#     -d \
#     postgres
# optional persist data
#-v ./postgres-data:/var/lib/postgresql/data \
dir=$PWD
cd postgres
nix-shell --run ". ./start.sh"
cd $dir
}
