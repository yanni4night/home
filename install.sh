#!/bin/bash

for f in `ls -A custom_scripts`;
do
    cp -rf "custom_scripts/$f" ~/
done