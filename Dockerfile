FROM alpine:3.3
MAINTAINER trotro

RUN apk update && apk add git

ENV HOME /root

# Put convienience-script into container to have it accessible
# without checking out from github-repo. Display with:
# $ docker run --entrypoint=/bin/cat axeclbr/git /root/git
COPY git /root/git
VOLUME /root/workspace
WORKDIR /root/workspace

ENTRYPOINT ["/usr/bin/git"]
