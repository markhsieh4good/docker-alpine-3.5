FROM alpine:3.5
# docker pull alpine:3.5
LABEL MAINTAINER "mark.hsieh <qqzcmark@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update 
RUN apk add --no-cache procps net-tools 
RUN apk add --no-cache tzdata
