#!/bin/bash

fn=file.test
rm "$fn".*

set -e

i=0
fold="$fn"

dd if=/dev/urandom of="$fn" bs=1024 count=1024

while true; do
  fnew="$fn.$i"
  mv "$fold" "$fnew"
  fold="$fnew"
  echo "Upload $fnew"
  curl --silent --show-error --fail -i fileshare.s<номер студента>.edu.slurm.io/files/ -T "$fnew"
  sleep 1
  i=$(( i + 1 ))
done
