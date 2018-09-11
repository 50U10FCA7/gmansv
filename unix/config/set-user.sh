#!/bin/bash

if [-z "$1"]; then
	read user -p "Enter new user: "
else
	user=$1
fi

config="./../../config"
readline="./../utils/rline.sh"
writeline="./../utils/wline.sh"

config_group=`$readline $config 2`
config_repositories=`$readline $config 3`

for repository in $config_repositories/*/; do
    chown -R $user:$config_group $repository
done

bash $writeline $config 1 $user
