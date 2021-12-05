#!/bin/bash

echo 'user:'
while read line
do
  echo $line | awk '{print "  " substr($4, 1, length($4)-1) ":"}'
  echo "    exists: true"
  echo $line | awk '{print "    uid: " substr($6, 1, length($6)-1)}'
  gname=$(echo $line | awk '{print substr($8, 1, length($8)-1)}')
  gid=$(grep $gname data/group.list | awk '{print $6}')
  echo "    gid: $gid"
  echo "    groups:"
  echo "    - $gname"
  groups=$(echo $line | awk 'BEGIN{FS=" ";OFS=" "}{print substr($10, 1, length($10)-1)}' | sed -e 's/"//g')
  if [ -n "$groups" ]; then
    for i in $(echo $groups | sed 's/,/\n/g')
    do
      echo "    - $i"
    done
  fi
  echo $line | awk '{print "    home: " substr($12, 1, length($12)-1)}'
  echo $line | awk '{print "    shell: " substr($11, 1, length($11)-1)}'
done <$1
