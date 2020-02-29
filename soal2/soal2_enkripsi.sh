#!/bin/bash

now=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')
low=(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)
up=(ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ)
x=$(echo $1|grep -oP  '.*(?=\.txt)')
namabaru=$(echo $x|tr ${low:0:26}${up:0:26} ${low:$now:26}${up:$now:26})
mv $1 $namabaru".txt"
