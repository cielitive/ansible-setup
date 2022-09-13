#!/usr/bin/bash

input=$1
output="output.tmp"
cp -p "$input" input.bk

echo "tomcat:" >"$output"
echo "  instance:" >>"$output"

IFS=$'\n'
for line in $(cat "$input" | sed '1,2d')
do
  echo "$line" >>"$output"

  name=$(echo $line | awk -F', |: ' '{print $2}')
  echo $name
  num=$(echo $line | awk -F', |: ' '{print $4}')
  echo $num

  if [[ "$name" == "service" || "$name" == "test" ]] && [[ "$num" == 1 ]]; then
    for i in $(seq 1 5)
    do
      echo "    - { num: $(( $num + $i )) }" >>"$output"
    done
  fi
done

mv "$output" "$input"
