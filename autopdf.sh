#!/bin/sh

NAME="mnt/doc"

SERVER_DIR="/server"

compile() {
  platex $NAME.tex
  dvipdfmx $NAME.dvi $SERVER_NAME/$NAME.pdf
}

checksum() {
  echo `md5sum $NAME.tex`
}

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
