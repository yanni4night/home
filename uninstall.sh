#!/bin/bash

for f in `ls -A custom_scripts`;
do
    rm -rf ~/$f
done