FROM alpine

RUN apk --no-cache add lsyncd openssh supervisor

ADD init.sh /usr/local/bin/init.sh

EXPOSE 22
CMD ["/usr/local/bin/init.sh"]
