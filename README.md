[![](https://badge.imagelayers.io/trotro/alpine-git:2.6.4.svg)](https://imagelayers.io/?images=trotro/alpine-git:2.6.4 'Get your own badge on imagelayers.io')

# docker-git

Docker-Container behaving (nearly) like a git-binary.

Written for my personal private own use only. Comes without any guarantees.

## Usage

The container contains a helper script for convienient usage. Just print it out and make it accessible in your ``PATH`` and executable like this.

    $ docker run --entrypoint=/bin/cat trotro/git:2.6.4 /root/git > $HOME/bin/dgit && chmod +x $HOME/bin/dgit

To check if it works it makes sense to just ask for the git version by typing:

    $ dgit --version
    git version 2.6.4

If you want to use another name just change it from ``dgit`` to your desired name.

Now you can start using ``dgit`` just like a local git installation.

## Debugging

The Dockerfile uses "``ENTRYPOINT``" and not "``CMD``" to behave more like the git-binary. This means, that passing /bin/bash to it will result in an error-message of git ("git: '/bin/bash' is not a git command. See 'git --help'.") and *not* open a Shell.

 To start a Shell inside of the container you have to explicitly override the "``ENTRYPOINT``" instead:

    $ docker run -it --entrypoint /bin/bash trotro/git:2.6.4
