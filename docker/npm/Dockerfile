FROM debian:jessie

MAINTAINER "Ikezoe Makoto" <150283t@gmail.com>

RUN apt-get update -y
RUN apt-get install -y curl git
RUN curl -sL https://deb.nodesource.com/setup | bash --
RUN apt-get install -y nodejs
RUN npm update -g npm

RUN mkdir -p /var/www/html
VOLUME ["/var/www/html"]
WORKDIR /var/www/html

ENTRYPOINT ["npm"]
CMD ["-h"]