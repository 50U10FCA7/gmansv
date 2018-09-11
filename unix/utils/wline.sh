#!/bin/bash

filename=$1
line=$2
contents=$3

sed -i "${line}s/.*/${contents}/" $filename