#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

if [-z "$2"]; then
	read branch -p "Enter new deploy branch: "
else
	branch=$2
fi

config="./../../config"
readline="./../utils/rline.sh"

config_repositories=`$readline $config 3`

repository=$config_repositories"/"$name".git/"

cd $repository
echo $branch > addons-branch
git worktree add $repository $branch
