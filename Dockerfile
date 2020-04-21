FROM alpine:latest

RUN apk update && apk add --no-cache nodejs npm texlive-full

RUN npm install -g livereloadx

RUN npm uninstall -g npm

RUN mkdir /work/ && mkdir /work/mnt && mkdir /server/

ADD autopdf.sh /work/

ADD index.html /server/

CMD ["/bin/sh","-c","livereloadx -s /server && sh -c 'cd /work/ && ./autopdf.sh'"]
