FROM phusion/baseimage:0.9.15

MAINTAINER moltar <moltar@moltar.net>

ENV DEBIAN_FRONTEND     noninteractive
ENV PLENV_ROOT          /usr/local/plenv
ENV PATH                $PLENV_ROOT/bin:$PATH

ADD run.sh /run.sh

RUN apt-get update -qq && apt-get install -y gcc make perl-modules && \
    mkdir -p $PLENV_ROOT/plugins/perl-build && \
    curl -L --silent https://github.com/tokuhirom/plenv/archive/2.1.1.tar.gz     | tar -xz --strip 1 -C $PLENV_ROOT && \
    curl -L --silent https://github.com/tokuhirom/Perl-Build/archive/1.10.tar.gz | tar -xz --strip 1 -C $PLENV_ROOT/plugins/perl-build && \
    echo 'eval "$(plenv init -)"' >> /etc/profile.d/plenv.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/run.sh"]

ONBUILD ADD ./.perl-version /tmp/.perl-version
ONBUILD RUN bash -lc 'for v in $(cat /tmp/.perl-version); do plenv install $v && plenv shell $v && plenv install-cpanm && plenv rehash && echo $v > /etc/container_environment/PLENV_VERSION; done; rm -rf /usr/local/plenv/build/* /tmp/.perl-version;'
