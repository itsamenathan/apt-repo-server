#!/bin/bash

DATA="/data"

while RES=$(inotifywait -e modify,moved_to,create,delete --format '%:e %f' $DATA ); do 
  echo "$RES"
  cd "$data"
  dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
done
