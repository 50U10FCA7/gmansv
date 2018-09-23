#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$2" ]; then
	read deploy -p "Auto deploy project? [Yy1/Nn0]: "
else
	deploy=$3
fi

repository=$config_repositories"/$name.git"
addon="$config_gmod/garrysmod/addons/$name"

cd $repository

if [[ $deploy =~ ^[Yy]$ ]] || [[ $deploy = "1" ]]; then
    cp $config_repositories"/hook-update.sh" hooks/post-receive
else
    rm hooks/post-receive
    rm -rf $addon
fi
