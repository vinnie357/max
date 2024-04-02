#!/usr/bin/env bash
echo " adding helper scripts, type menu to see available commands"
# add project specifc helper scripts
if ! grep -qxF '#project specific helper scripts' ~/.bashrc; then
    cat << EOF >> ~/.bashrc
#project specific helper scripts
. /workspaces/max/init.sh
EOF
fi
echo "init done"
