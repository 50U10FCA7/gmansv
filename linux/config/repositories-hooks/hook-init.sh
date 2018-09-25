#!/bin/bash

#addons=$(cat addons)
#name=$(cat addon)
#branch=$(cat addon-branch)
#addon=$addons$name

#git worktree add $addon $branch

cd hooks

cp "./../../hook-update-tmp.sh" .
cp "./../../hook-update.sh" .

bash "hook-update-tmp.sh"
