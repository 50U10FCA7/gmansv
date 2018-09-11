#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

if [-z "$2"]; then
	read group -p "Enter new group: "
else
	group=$2
fi

config="./../../config"
readline="./../utils/rline.sh"

config_user=`$readline $config 1`
config_repositories=`$readline $config 3`

repository=$config_repositories"/"$name".git"

chown -R $config_user:$group $repository
