#!/bin/bash

gitignore='.gitignore'

ignorefiles='*DS_Store ._* *.swp *.pyc node-debug.log npm-debug.log node_modules bower_components .svn'

if [ -e $gitignore ];then
    echo "\033[32m$gitignore already exists\033[0m"
    exit
fi

for f in $ignorefiles
    do
        echo $f >> $gitignore
    done

echo "\033[32m$gitignore created\033[0m"
