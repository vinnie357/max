#!/bin/bash
function pg-stop {
# name=${1:-'postgres'}
# docker stop $name && docker rm $name
dir=$PWD
cd postgres
nix-shell --run ". ./stop.sh"
cd $dir
}
