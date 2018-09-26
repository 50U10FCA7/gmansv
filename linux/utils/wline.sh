#!/bin/bash

awk -v line="${2}" -v contents="${3}" 'NR==line {$0=contents} 1' ${1} > ${1}.tmp
rm ${1}
mv ${1}.tmp ${1}
