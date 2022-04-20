#!/bin/bash

git config alias.st status --global
git config alias.br branch --global
git config alias.ci commit --global
git config alias.co checkout --global

for f in `ls -A custom_scripts`;
do
    cp -rf custom_scripts/$f ~/
done