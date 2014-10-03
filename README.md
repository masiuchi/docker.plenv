## plenv - base image for managing Perl versions with plenv ##

This is only a base image for installing various Perl versions. This image uses the `ONBUILD` instruction to build Perl versions in the children images.

This Docker image will install `plenv` and Perl version(s) from `.perl-version` file.

In addition to basic Perl it will install `cpanm` for each Perl version.

The image is based on [baseimage-docker](/phusion/baseimage-docker).

## Usage ##

```bash
$ echo -n "5.20.1" > .perl-version
$ echo "FROM moltar/plenv:latest" > Dockerfile
$ docker build -t perl-$(cat .perl-version) .
$ docker run --rm perl-$(cat .perl-version) exec cpanm Carton
```