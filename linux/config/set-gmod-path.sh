#!/bin/bash

if [ -z "$3" ]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$3
fi

for repository in $config_repositories/*/; do
    echo $gmod"/garrysmod/addons/" > $repository"addons"
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 21 "config_gmod='$gmod'"
