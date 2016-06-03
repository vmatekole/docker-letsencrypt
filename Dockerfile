FROM alpine:3.3
MAINTAINER <victor@matekole.com>
RUN apk add --update --no-cache docker \
								build-base \
								py-pip \
								python-dev \	
								python \
							    bash \
							    alpine-sdk \
							    libffi-dev \
							    make \
							    linux-headers \
							    augeas-dev \
							    sudo \
							    openssl-dev
VOLUME /etc/letsencrypt /var/lib/letsencrypt
VOLUME /var/log/letsencrypt /var/log
WORKDIR /etc/letsencrypt
ADD https://bootstrap.pypa.io/get-pip.py .
RUN python get-pip.py
RUN pip install virtualenv
ADD https://dl.eff.org/certbot-auto /usr/bin/certbot-auto
RUN chmod +x /usr/bin/certbot-auto
RUN  certbot-auto -v --os-packages-only 
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT source /entrypoint.sh
# CMD ["crond","-f", "-d", "8"]
EXPOSE 443