#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

config="./../../config"
readline="./../utils/rline.sh"

config_user=`$readline $config 1`
config_group=`$readline $config 2`
config_repositories=`$readline $config 3`
config_gmod=`$readline $config 4`
config_branch=`$readline $config 5`

repository=$config_repositories"$name.git"
addons="$config_gmod/garrysmod/addons/"
addon="$addons$name"

mkdir $repository
chmod -R 770 $repository
chown -R $config_user:$config_group $repository

mkdir $addon
chown -R $config_user:$config_group $addon
chmod -R 770 $addon

cd $repository
git init --bare
echo $addons > addons
echo $name > addon
echo $config_branch > addon-branch

cd hooks
cp $config_repositories"/hook-init.sh" post-receive
chmod -R 750 .
