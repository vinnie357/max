#!/bin/bash
function pg-cleanup {
# name=${1:-'postgres'}
# docker stop $name && docker rm $name
dir=$PWD
cd postgres
nix-shell --run ". ./cleanup.sh"
cd $dir
}
