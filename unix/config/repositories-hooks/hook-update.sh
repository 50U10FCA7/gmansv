#!/bin/bash

addons=$(cat addons)
name=$(cat addon)
branch=$(cat addon-branch)
addon=$addons$name

repository=$(pwd)

while read oldrev newrev ref do
	if [[ $ref = refs/heads/$branch ]]; then
		git --work-tree=$addon --git-dir=$repository checkout -f
	fi
done
