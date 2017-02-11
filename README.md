# docker-git

[![Build Status](https://travis-ci.org/axeclbr/docker-git.svg?branch=master)](https://travis-ci.org/axeclbr/docker-git)

[![](https://images.microbadger.com/badges/image/axeclbr/git.svg)](https://microbadger.com/images/axeclbr/git "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/axeclbr/git.svg)](https://microbadger.com/images/axeclbr/git "Get your own version badge on microbadger.com")

Docker-Container behaving (nearly) like a git-binary.

Written for my personal private own use only. Comes without any guarantees.

## Usage

The container contains a helper script for convienient usage. Just print it out and make it accessible in your ``PATH`` and executable like this.

    $ docker run --entrypoint=/bin/cat axeclbr/git /root/git > $HOME/bin/dgit && chmod +x $HOME/bin/dgit

To check if it works it makes sense to just ask for the git version by typing:

    $ dgit --version
    git version 2.6.4

If you want to use another name just change it from ``dgit`` to your desired name.

Now you can start using ``dgit`` just like a local git installation.

## Debugging

The Dockerfile uses "``ENTRYPOINT``" and not "``CMD``" to behave more like the git-binary. This means, that passing /bin/bash to it will result in an error-message of git ("git: '/bin/bash' is not a git command. See 'git --help'.") and *not* open a Shell.

 To start a Shell inside of the container you have to explicitly override the "``ENTRYPOINT``" instead:

    $ docker run -it --entrypoint /bin/bash axeclbr/git
