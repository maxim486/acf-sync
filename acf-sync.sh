#!/bin/bash
folder="/run/media/mmcblk0p1/steamapps"
cd $folder

mkdir -p acf-backup
mv *.acf acf-backup/

echo "$(ls common)" | grep -v "Steam.dll" > tmp.file

file="tmp.file"
while read line; do
  acf=$(grep -l "${line}" acf-backup/*.acf)
  cp -ra $acf .
done < "${file}"

rm tmp.file
