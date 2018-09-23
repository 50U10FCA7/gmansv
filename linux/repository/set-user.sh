#!/bin/bash

if [ -z "$3" ]; then
	read name -p "Enter repository name: "
else
	name=$3
fi

if [ -z "$4" ]; then
	read user -p "Enter new user: "
else
	user=$4
fi

repository=$config_repositories"/"$name".git"

chown -R $user:$config_group $repository
