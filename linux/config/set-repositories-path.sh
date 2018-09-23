#!/bin/bash

if [ -z "$3" ]; then
	read repositories -p "Enter new repositories path: "
else
	repositories=$3
fi

mkdir $repositories
chown -R $config_user:$config_group $repositories
chmod -R 777 $repositories

cp repositories-hooks/* $repositories
cp $config_repositories/* $repositories

rm -rf $config_repositories

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 20 "config_repositories='$repositories'"
