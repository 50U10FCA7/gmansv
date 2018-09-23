#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$4" ]; then
	read branch -p "Enter new deploy branch: "
else
	branch=$4
fi

repository=$config_repositories"/"$name".git/"

cd $repository
echo $branch > addons-branch
git worktree add $repository $branch
