#!/bin/bash

if [ -z "$1" ]; then
	read library -p "Enter library name: "
else
	library=$1
fi

if [ -z "$2" ]; then
	read script -p "Enter script name: "
else
	script=$2
fi



#config
config_user="username"
config_group="usergroup"
config_repositories="/home/username/gman_repositories"
config_gmod="/home/username/gmod"
config_branch="master"
#config_repositories, config_gmod - sets without '/' at end



cd $library
source $script
