#!/bin/bash

bash "hook-update.sh"
mv "hook-update.sh" post-receive
rm $0
