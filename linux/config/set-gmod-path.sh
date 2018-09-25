#!/bin/bash

if [ -z "$3" ]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$3
fi

gman="./../gman.sh"
writeline="./../utils/wline.sh"

for repository in $config_repositories/*/; do
    bash $writeline $repository"hooks/post-receive" 3 "addons='$gmod/garrysmod/addons/'"
done

bash $writeline $gman 21 "config_gmod='$gmod'"
