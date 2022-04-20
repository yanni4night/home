#!/bin/bash

branch=$(git branch --show-current)
cmd="$1"
opt='push'

if [ $branch = '' ];then
  echo "\033[0;31mCannot find current branch\033[0m"  
  exit
fi

if [ "$cmd" != 'push' ] && [ "$cmd" != 'pull' ];then
    echo "\033[0;31mYou can only push or pull, not \"$1\"\033[0m"
    exit
else
    opt=$cmd
fi

echo "\033[0;32mgit $opt origin $branch\033[0m"
git $opt origin $branch --tag
