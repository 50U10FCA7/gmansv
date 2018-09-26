#!/bin/bash

if [ -z "$3" ]; then
	read user -p "Enter new user: "
else
	user=$3
fi

for repository in $config_repositories/*/; do
    chown -R $user:$config_group $repository
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 18 "config_user=\"$user\""
