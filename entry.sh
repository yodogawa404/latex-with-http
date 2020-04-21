#!/bin/sh

NAME=/work/mnt/doc.tex
NAME_MINI=$(echo $NAME | sed -e 's/\..*.//')

function md5() {
    echo $(md5sum $NAME | awk '{ print $1 }')
}

LAST=$(md5)

function compile() {
    platex /work/mnt/doc.tex && dvipdfmx doc.dvi && mv doc.pdf /work/mnt/
}

function check() {
    CURRENT=$(md5)
    if [ "$LAST" != "$CURRENT" ];
    then
        compile
        echo "compiled!"
        LAST=$CURRENT
    fi
}

compile

http-server -p 8080 /work/mnt

while true;
do
    sleep 1
    check
done
