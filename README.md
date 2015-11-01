# dgit

Docker-Container behaving (nearly) like a git-binary.

Written for my personal private own use only. Comes without any guarantees.

## Usage

Make the file ``dgit`` accessible in your ``PATH``, e.g.:

    ln -s $(pwd)/dgit $HOME/bin/dgit

## Debugging

The Dockerfile uses "``ENTRYPOINT``" and not "``CMD``" to behave more like the git-binary. This means, that passing /bin/bash to it will result in an error-message of git ("git: '/bin/bash' is not a git command. See 'git --help'.") and *not* open a Shell.

 To start a Shell inside of the container you have to explicitly override the "``ENTRYPOINT``" instead:

    docker run -it --entrypoint /bin/bash axeclbr/git
