#!/bin/bash

if [ -z "$1" ]; then
	read branch -p "Enter new deploy branch: "
else
	branch=$1
fi

cd $config_repositories
for repository in */; do
    addon=$config_gmod"/garrysmod/addons/"$(basename $repository)
    cd $repository
    echo $branch > $repository"/addons-branch"
    git worktree add $addon $branch
    cd $config_repositories
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 22 "config_branch='$branch'"
