## Docker base image for managing Perl versions with plenv ##

This is only a base image for installing various Perl versions. This image uses `ONBUILD` instruction to build Perl versions in children images.

This image will install `plenv` and Perl version(s) from `.perl-version` file.

In addition to basic Perl it will install `cpanm` for each Perl version.

The image is based on [baseimage-docker](https://github.com/phusion/baseimage-docker).

## Usage ##

### Dockerfile ###

```
FROM moltar/plenv:latest
ENV PLENV_VERSION 5.20.1
```

### Build ###

```
$ export PERL_VERSION=5.20.1
$ echo -n $PERL_VERSION > .perl-version
$ docker build -t perl-$PERL_VERSION .
$ docker run --rm perl-$PERL_VERSION exec cpanm Carton
```