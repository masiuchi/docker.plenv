#!/usr/bin/env sh

PLENV_VERSION=${1:-$PLENV_VERSION}

echo "Installing Perl $PLENV_VERSION via plenv"

## Ideally, would like to use "plenv shell" instead of "plenv global", but
## this bug prevents this: https://github.com/tokuhirom/plenv/issues/42
## basically "plenv shell" does not work with "sh -c"

plenv install $PLENV_VERSION        && \
plenv global $PLENV_VERSION         && \
plenv install-cpanm                 && \
plenv rehash                        && \
rm -rf /usr/local/plenv/build/* /root/.cpanm/;