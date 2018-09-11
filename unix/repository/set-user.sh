#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

if [-z "$2"]; then
	read user -p "Enter new user: "
else
	user=$2
fi

config="./../../config"
readline="./../utils/rline.sh"

config_group=`$readline $config 2`
config_repositories=`$readline $config 3`

repository=$config_repositories"/"$name".git"

chown -R $user:$config_group $repository
