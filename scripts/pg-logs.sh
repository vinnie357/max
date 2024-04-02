#!/bin/bash
function pg-logs {
# name=${1:-'postgres'}
# docker stop $name && docker rm $name
tail -f postgres/logfile
}
