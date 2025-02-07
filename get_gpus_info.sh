#!/bin/bash

result=$(/usr/bin/nvidia-smi -L)
declare -a gpu_data

while IFS= read -r line; do
  index=$(echo "$line" | awk -F':| ' '{print $2}')
  gpuuuid=$(echo "$line" | grep -oP '(?<=UUID: GPU-)[^)]+')

  gpu_data+=("{\"{#GPUINDEX}\":\"$index\", \"{#GPUUUID}\":\"GPU-$gpuuuid\"}")
done < <(printf '%s\n' "$result")

echo -e "{\n\"data\":[\n$(IFS=,; echo "${gpu_data[*]}")\n]\n}"
