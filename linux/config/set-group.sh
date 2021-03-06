#!/bin/bash

if [ -z "$3" ]; then
	read group -p "Enter new group: "
else
	group=$3
fi

for repository in $config_repositories/*/; do
    chown -R $config_user:$group $repository
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 19 "config_group=\"$group\""
