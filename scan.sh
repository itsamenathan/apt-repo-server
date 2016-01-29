#!/bin/bash

DATA="/data"
cd "$data"

dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz

while RES=$(inotifywait -e modify,moved_to,create,delete --format '%:e %f' $DATA ); do 
  echo "$RES"
  dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
done
