#!/bin/bash
function start {
nix-shell --run "mix phx.server"
}
