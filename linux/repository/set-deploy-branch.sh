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

postreceive=$config_repositories"/"$name".git/hooks/post-receive"

writeline="./../utils/wline.sh"
bash $writeline $postreceive 6 "branch=\"$branch\""
