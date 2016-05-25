FROM alpine:3.3
MAINTAINER <victor@matekole.com>
RUN apk add --update --no-cache docker
RUN git clone https://github.com/certbot/certbot.git /usr/bin/certbot
ENV PATH $PATH:/usr/bin/certbots
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT source /entrypoint.sh
# CMD ["crond","-f", "-d", "8"]
EXPOSE 443

	
