#!/bin/bash

list_file="disable-package.list"
android_version=$(adb shell getprop ro.build.version.release)

echo "Android Version: ${android_version}"

if [ ! -f "${list_file}" ]; then
  echo "Error: List ile '${list_file}' not found."
  exit 1
fi

while IFS= read -r line; do


  if [[ "$line" == \#* || -z "$line" ]]; then
    continue
  fi
  echo "\"${line}\""

done < "${list_file}"
