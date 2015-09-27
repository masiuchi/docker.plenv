## Docker base image for managing Perl versions with plenv ##

This is only a base image for installing various Perl versions.

This image provides an installation of `plenv` and a helper script `plenv_install_perl.sh` to cleanly install Perl versions.

In addition to basic Perl, it will install `cpanm` for each Perl version.

The image is based on [phusion/baseimage](https://registry.hub.docker.com/u/phusion/baseimage).

The image is available as a trusted build on [Docker Hub](https://registry.hub.docker.com/u/moltar/plenv/).

## Usage ##

### Dockerfile ###

```
FROM moltar/plenv:latest
ENV PLENV_VERSION 5.20.1
RUN $PLENV_INSTALL $PLENV_VERSION
```

### Build ###

```
$ docker build -t my-perl .
$ docker run --rm my-perl exec perl -v
```

## See Also ##

* [phusion/baseimage](https://registry.hub.docker.com/u/phusion/baseimage)
* [moltar/plenv.perl-latest](https://registry.hub.docker.com/u/moltar/plenv.perl-latest/)