#!/usr/bin/env bash
scripts_folder="./scripts"
scripts=()
while IFS= read -r line; do
  scripts+=("$line")
done < <( ls -p "$scripts_folder" | grep -v / )

# menu
menu() {
  echo "==== scripts ===="
  for script in "${scripts[@]}"
  do
    echo "${script%.*}"
  done
}

# imports
for script in "${scripts[@]}"
do
    . "$scripts_folder/$script"
    echo "adding: ${script%.*}"
done

echo "==== init done ===="
