FROM alpine:latest

RUN apk update && apk add --no-cache nodejs npm texlive-full

RUN mkdir /work/ && mkdir /work/mnt && mkdir /server/

RUN npm install -g http-server

ADD index.html /server/

ADD entry.sh /work/

CMD /work/entry.sh
