FROM alpine

RUN apk --no-cache add lsyncd openssh supervisor

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
