#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$4" ]; then
	read group -p "Enter new group: "
else
	group=$4
fi

repository=$config_repositories"/"$name".git"

chown -R $config_user:$group $repository
