#!/bin/bash

if [-z "$1"]; then
	read repositories -p "Enter new repositories path: "
else
	repositories=$1
fi

config="./../../config"
readline="./../utils/rline.sh"
writeline="./../utils/wline.sh"

config_user=`$readline $config 1`
config_group=`$readline $config 2`
config_repositories=`$readline $config 3`

mkdir $repositories
chown -R $config_user:$config_group $repositories
chmod -R 777 $repositories

cp repositories-hooks/* $repositories
cp $config_repositories/* $repositories

rm -rf $config_repositories

bash $writeline $config 3 $repositories
