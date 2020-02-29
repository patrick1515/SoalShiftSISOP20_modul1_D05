#!/bin/bash

up=(ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ)
low=(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)
now=$(stat -c %y $1|grep -oP '(?<=[^ ] ).*(?=:.*:)')

back=$(echo "${1%.txt}"|tr ${low:$now:26}${up:$now:26} ${low:0:26}${up:0:26})
mv $1 $back".txt"
