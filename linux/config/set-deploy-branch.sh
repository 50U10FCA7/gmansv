#!/bin/bash

if [ -z "$3" ]; then
	read branch -p "Enter new deploy branch: "
else
	branch=$3
fi

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 22 "config_branch=\"$branch\""

cd $config_repositories
for repository in */; do
    cd $repository
    bash $writeline ./hooks/post-receive 6 "branch=\"$branch\""
    cd $config_repositories
done
