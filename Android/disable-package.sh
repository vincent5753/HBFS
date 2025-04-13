#!/bin/bash

list_file="disable-package.list"
android_version=$(adb shell getprop ro.build.version.release)
android_codename=$(adb shell getprop ro.build.version.codename)

echo "Android Version: ${android_version}"
echo "Android Codename: ${android_codename}"

if [[ -z "${android_version}" ]]; then
  echo "Error: Fail retrieving Android version, exit now."
  exit 1
fi

# ref: https://android.stackexchange.com/questions/56620/enable-and-disable-system-apps-via-adb
if (( $(echo "${android_version} > 5" | bc -l) )); then
  # Android version is higher than Lollipop.
  echo "Android version ${android_version} is higher than Lollipop, will use \"pm disable-user\" to disable packages."
  disable_package_method="disable-user"
elif [[ "${android_codename}" == "Lollipop" ]]; then
  # Android version is Lollipop
  echo "Android version ${android_version} is Lollipop, will use \"pm hide\" to disable packages."
  disable_package_method="hide"
elif [[ "${android_codename}" == "KitKat" ]]; then
  # Android version is KitKat
  echo "Android version ${android_version} is Lollipop, will use \"pm block\" to disable packages."
  disable_package_method="block"
else
  # WTF
  echo "Unknow Android Version, exit now."
  exit 404
fi

echo "Disable Package Method: ${disable_package_method}"
echo ""

if [ ! -f "${list_file}" ]; then
  echo "Error: List ile '${list_file}' not found."
  exit 1
fi

while IFS= read -r line_in_list_file; do

  # Skip line starts with # or empty lines
  if [[ "${line_in_list_file}" == \#* || -z "${line_in_list_file}" ]]; then
    continue
  fi
  echo "\"${line_in_list_file}\""
  # ref: https://stackoverflow.com/questions/44634478/why-does-adb-commands-break-a-bash-script-loop
  adb shell -n pm "${disable_package_method}" "${line_in_list_file}"

done < "${list_file}"
