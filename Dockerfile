FROM axeclbr/debian

MAINTAINER axeclbr <axeclbr@posteo.de>

RUN \
      apt-get update && \
      apt-get -y upgrade && \
      apt-get install -y git vim curl wget man && \
      rm -rf /var/lib/apt/lists/*

ENV HOME /root

# Put convienience-script into container to have it accessible
# without checking out from github-repo
COPY git /root/git

VOLUME /root/workspace

WORKDIR /root/workspace

ENTRYPOINT ["/usr/bin/git"]
