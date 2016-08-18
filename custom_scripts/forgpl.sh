#!/bin/bash

for f in `ls -A`;
do
    if [ -d "$f" ];then
        cd $f
        sh ~/git.sh pull
        cd ..
    fi
done