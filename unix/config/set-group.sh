#!/bin/bash

if [-z "$1"]; then
	read group -p "Enter new group: "
else
	group=$1
fi

config="./../../config"
readline="./../utils/rline.sh"
writeline="./../utils/wline.sh"

config_user=`$readline $config 1`
config_repositories=`$readline $config 3`

for repository in $config_repositories/*/; do
    chown -R $config_user:$group $repository
done

bash $writeline $config 2 $group
