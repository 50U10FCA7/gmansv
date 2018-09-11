#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

if [-z "$2"]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$2
fi

config="./../../config"
readline="./../utils/rline.sh"

config_repositories=`$readline $config 3`

repository=$config_repositories"/"$name".git/"

echo $gmod"/garrysmod/addons/" > $repository"addons"
