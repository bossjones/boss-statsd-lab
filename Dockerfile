# FROM behance/docker-base:2.7-ubuntu-20.04
FROM behance/docker-base:2.7-alpine
# FROM golang:1.12.8-alpine3.9


# ENV PACKER_DEV=1
# ARG VERSION=v1.3.5
# ENV VERSION=$VERSION

# RUN apk add --update git bash openssl vim
# RUN go get github.com/mitchellh/gox
# RUN go get github.com/hashicorp/packer

# WORKDIR $GOPATH/src/github.com/hashicorp/packer

# RUN git checkout tags/${VERSION}

# RUN /bin/bash scripts/build.sh

# WORKDIR $GOPATH

# ENV PATH="$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# COPY bin/startup.sh .
# COPY entrypoint.sh /entrypoint.sh
# RUN "./startup.sh"

# # ENTRYPOINT ["bin/packer"]
# ENTRYPOINT ["/entrypoint.sh"]

# apt install nodejs
# RUN apt-get update && apt-get install nodejs npm python-dev build-essential git -y

# Install python
RUN apk add --no-cache --update g++ gcc libgcc libstdc++ linux-headers make python git bash zsh nodejs npm vim htop netcat-openbsd

RUN git clone https://github.com/statsd/statsd /usr/src/app

WORKDIR /usr/src/app

# Set graphite hostname to "graphite"
RUN \
  ls -la && \
  cp -v exampleConfig.js config.js && \
  sed -i 's/graphite.example.com/graphite/' config.js

# Expose required ports
EXPOSE 8125/udp
EXPOSE 8126

# Start statsd
# ENTRYPOINT [ "node", "stats.js", "config.js" ]
