#!/bin/bash

filename=$1
line=$2

echo `sed "${line}q;d" $filename`
