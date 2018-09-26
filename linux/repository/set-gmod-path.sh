#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$4" ]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$4
fi

postreceive=$config_repositories"/"$name".git/hooks/post-receive"
addons=$gmod"/garrysmod/addons/"

writeline="./../utils/wline.sh"
bash $writeline $postreceive 3 "addons=\"$addons\""
