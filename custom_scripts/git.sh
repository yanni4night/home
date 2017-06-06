#!/bin/bash

#branch=`git br | awk '{if($1=="*"){print $2}}'`
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
cmd="$1"
opt='push'

if [ $branch = '' ];then
  echo "\033[0;31mCannot find current branch\033[0m"  
  exit
fi

if [ "$cmd" != 'push' ] && [ "$cmd" != 'pushr' ] && [ "$cmd" != 'pull' ];then
    echo "\033[0;31mYou can do push or pull,not \"$1\"\033[0m"
    exit
else
    opt=$cmd
fi

if [ "$cmd" = 'pushr' ];then
    echo "\033[0;32mgit $opt origin HEAD:refs/for/$branch\033[0m"
    git push origin HEAD:refs/for/$branch
else
    echo "\033[0;32mgit $opt origin $branch\033[0m"
    git $opt origin $branch --tag
fi
