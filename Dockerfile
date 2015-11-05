FROM axeclbr/debian

MAINTAINER axeclbr <axeclbr@posteo.de>

ENV GIT_VERSION="2.6.2"
ENV GIT_FOLDER_NAME="git-${GIT_VERSION}"
ENV GIT_ARCHIVE_NAME="${GIT_FOLDER_NAME}.tar.gz"

RUN apt-get -y update && apt-get -y upgrade

RUN \
      apt-get -y install \
        build-essential \
        gettext \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        libssl-dev \
        libz-dev \
        wget && \
      wget https://www.kernel.org/pub/software/scm/git/${GIT_ARCHIVE_NAME} --directory-prefix=/tmp/ && \
      cd /tmp && \
      tar xzf ${GIT_ARCHIVE_NAME} && \
      cd /tmp/git-${GIT_VERSION} && \
      make prefix="/usr/local" install && \
      rm -rf /tmp/${GIT_ARCHIVE_NAME} /tmp/${GIT_FOLDER_NAME} && \
      apt-get -y remove \
        build-essential \
        gettext \
        wget && \
      apt-get -y install less && \
      apt-get -y autoremove && apt-get -y clean && apt-get -y autoclean && \
      rm -rf /var/lib/apt/lists/*

ENV HOME /root

# Put convienience-script into container to have it accessible
# without checking out from github-repo. Display with:
# $ docker run --entrypoint=/bin/cat axeclbr/git /root/git
COPY git /root/git

VOLUME /root/workspace

WORKDIR /root/workspace

ENTRYPOINT ["/usr/local/bin/git"]
