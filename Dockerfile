FROM alpine:3.3
MAINTAINER <victor@matekole.com>
RUN apk add --update --no-cache docker
COPY tasks/ /etc/periodic/
RUN chmod -R +x /etc/periodic/
RUN git clone https://github.com/certbot/certbot
ENTRYPOINT crond

