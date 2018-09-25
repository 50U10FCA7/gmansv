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

writeline="./../utils/wline.sh"
bash $writeline ./post-receive 3 "addons='$config_gmod/garrysmod/addons/'"
bash $writeline ./post-receive 3 "name='$name'"
bash $writeline ./post-receive 3 "branch='$config_branch'"

chmod -R 750 $repository"/hooks"
cp $config_repositories"/hook-update.sh" $repository"/hooks/post-receive"

cd $repository
git init --bare
#echo $addons > addons
#echo $name > addon
#echo $config_branch > addon-branch
