#!/bin/bash
# install tools for container standup
echo "cwd: $(pwd)"
echo "---getting tools---"
sudo apt-get update -y

echo "$(uname -a )"
. .devcontainer/scripts/man-db.sh
. .devcontainer/scripts/initrc.sh


echo "---tools done---"
