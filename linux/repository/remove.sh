#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

repository=$config_repositories"/$name.git"
addons="$config_gmod/garrysmod/addons/"
addon="$addons$name"

rm -rf $repository
rm -rf $addon
