#!/bin/sh

compile() {
  platex mnt/doc.tex
  dvipdfmx doc.dvi
  mv doc.pdf /server
}

checksum() {
  echo `md5sum mnt/doc.tex`
}

compile

LATEST=`checksum`

while true;
do
  sleep 1
  CURRENT=`checksum`
  if [ "$LATEST" != "$CURRENT" ];
  then
    compile
    echo "compiled!"
  fi
done
