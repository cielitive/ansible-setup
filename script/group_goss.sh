#!/bin/bash

echo 'group:'
while read line
do
  echo $line | awk '{print "  " substr($4, 1, length($4)-1) ":"}'
  echo "    exists: true"
  echo $line | awk '{print "    gid: " substr($6, 1, length($6)-1)}'
done <$1
