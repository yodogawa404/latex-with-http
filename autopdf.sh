#!/bin/sh

NAME="mnt/doc"

SERVER_DIR="/server"

compile() {
  platex $NAME.tex
  dvipdfmx $NAME.dvi
  mv $NAME.pdf $SERVER_DIR
}

checksum() {
  echo `md5sum $NAME.tex`
}

compile

LATEST=`checksum`

while true;
do
  sleep 1
  CURRENT=`checksum`
  if [ $LATEST != $CURRENT ];
  then
    compile
    echo "compiled!"
done
