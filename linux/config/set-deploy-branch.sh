#!/bin/bash

if [ -z "$3" ]; then
	read branch -p "Enter new deploy branch: "
else
	branch=$3
fi

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 22 "config_branch=\"$branch\""

for repository in */; do
    bash $writeline $repositories/$repository"hooks/post-receive" 6 "branch=\"$branch\""
done
