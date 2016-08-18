#!/bin/bash

for f in `svn st | awk '{if($1=="?"){print $2}}'`; do rm -rf $f;done;