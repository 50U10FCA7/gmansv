#!/bin/bash

if [-z "$1"]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$1
fi

config="./../../config"
readline="./../utils/rline.sh"
writeline="./../utils/wline.sh"

config_repositories=`$readline $config 3`
config_gmod=`$readline $config 4`

for repository in $config_repositories/*/; do
    echo $gmod"/garrysmod/addons/" > $repository"addons"
done

bash $writeline $config 4 $gmod
