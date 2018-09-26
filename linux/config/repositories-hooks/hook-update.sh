#!/bin/bash

addons=""
repositories=""
name=""
branch=""

addon=$addons$name
repository=$repositories"/"$name".git"

while read oldrev newrev ref do
	if [[ $ref = refs/heads/$branch ]]; then
		git --work-tree=$addon --git-dir=$repository checkout -f
	fi
done
