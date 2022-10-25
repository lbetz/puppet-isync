#!/bin/bash

source /etc/isync/isync.conf

while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete $SRC

  for srv in $SERVERS; do
    nohup rsync -az -e "ssh -i ${USER_KEY} -o StrictHostKeyChecking=no" $SRC/ $USER@$srv:$DST >/dev/null
  done

done
