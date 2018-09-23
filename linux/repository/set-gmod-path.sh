#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$4" ]; then
	read gmod -p "Enter new gmod path: "
else
	gmod=$4
fi

repository=$config_repositories"/"$name".git/"

echo $gmod"/garrysmod/addons/" > $repository"addons"
