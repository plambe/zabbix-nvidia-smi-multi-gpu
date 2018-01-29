#!/bin/bash

result=$(/usr/bin/nvidia-smi -L)
first=1

echo "{"
echo "\"data\":["

while IFS= read -r line
do
  if (( "$first" != "1" ))
  then
    echo ,
  fi
  index=$(echo -n $line | cut -d ":" -f 1 | cut -d " " -f 2)
  gpuuuid=$(echo -n $line | cut -d ":" -f 3 | tr -d ")" | tr -d " ")
  echo -n {"\"{#GPUINDEX}"\":\"$index"\", \"{#GPUUUID}"\":\"$gpuuuid\"}
  if (( "$first" == "1" ))
  then
#    echo ,
    first=0
  fi
done < <(printf '%s\n' "$result")

echo
echo "]"
echo "}"
