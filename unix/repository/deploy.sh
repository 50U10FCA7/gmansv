#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

if [-z "$2"]; then
	read deploy -p "Auto deploy project? [Yy1/Nn0]: "
else
	deploy=$2
fi

config="./../../config"
readline="./../utils/rline.sh"

config_user=`$readline $config 1`
config_group=`$readline $config 2`
config_repositories=`$readline $config 3`
config_gmod=`$readline $config 4`

repository=$config_repositories"$name.git"
addon="$config_gmod/garrysmod/addons/$name"

cd $repository

if [[ $deploy =~ ^[Yy]$ ]] || [[ $deploy = "1" ]]; then
    cp $config_repositories"/hook-update.sh" hooks/post-receive
else
    rm hooks/post-receive
    rm -rf $addon
fi
