#!/bin/bash

for f in `svn st | awk '{if($1=="M"){print $2}}'`; do svn revert $f;done;