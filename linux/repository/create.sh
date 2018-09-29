#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

repository=$config_repositories"/$name.git"
addons="$config_gmod/garrysmod/addons/"
addon="$addons$name"

mkdir $repository
chmod -R 770 $repository
chown -R $config_user:$config_group $repository

mkdir $addon
chown -R $config_user:$config_group $addon
chmod -R 770 $addon

prev_path=$(pwd)
cd $repository
git init --bare
cd $prev_path

hooks=$repository"/hooks"
postreceive=$hooks"/post-receive"

cp $config_repositories"/hook-update.sh" $postreceive

writeline="./../utils/wline.sh"
bash $writeline $postreceive 3 "addons=\"$addons\""
bash $writeline $postreceive 4 "repositories=\"$config_repositories\""
bash $writeline $postreceive 5 "name=\"$name\""
bash $writeline $postreceive 6 "branch=\"$config_branch\""

chmod -R 750 $hooks
