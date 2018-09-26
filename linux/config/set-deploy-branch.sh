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
    #addon=$config_gmod"/garrysmod/addons/"$(cat addon)
    bash $writeline ./hooks/post-receive 6 "branch=\"$branch\""
    #git worktree add $addon $branch
    cd $config_repositories
done
