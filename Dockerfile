FROM alpine:3.5
# docker pull alpine:3.5
LABEL MAINTAINER "mark.hsieh <qqzcmark@gmail.com>"

## install package
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update 
RUN apk add --no-cache procps net-tools bash
RUN apk add --no-cache tzdata git
RUN apk add --no-cache logrotate
RUN rm -rf /var/cache/apk/*

## setting network
COPY utility_loopback.sh .
RUN chmod +x ./utility_loopback.sh
RUN ./utility_loopback.sh

COPY utility_namespace_dns.sh .
RUN chmod +x ./utility_namespace_dns.sh
RUN ./utility_namespace_dns.sh

RUN mkdir -p /etc/logrotate.d
