FROM phusion/baseimage:0.9.15

MAINTAINER moltar <moltar@moltar.net>

ENV DEBIAN_FRONTEND     noninteractive
ENV PLENV_ROOT          /usr/local/plenv
ENV PATH                $PLENV_ROOT/bin:$PATH

ADD plenv_install_perl.sh $PLENV_ROOT/bin/plenv_install_perl.sh

RUN apt-get update -qq && \
    apt-get install -y gcc make perl-modules && \
    mkdir -p $PLENV_ROOT/plugins/perl-build && \
    curl -L --silent https://github.com/tokuhirom/plenv/archive/2.1.1.tar.gz     | tar -xz --strip 1 -C $PLENV_ROOT && \
    curl -L --silent https://github.com/tokuhirom/Perl-Build/archive/1.10.tar.gz | tar -xz --strip 1 -C $PLENV_ROOT/plugins/perl-build && \
    echo 'eval "$(plenv init -)"' >> /etc/profile.d/plenv.sh && \
    chmod 755 /etc/profile.d/plenv.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/sbin/my_init", "--", "plenv"]

ONBUILD ADD ./.perl-version /tmp/.perl-version
ONBUILD RUN plenv_install_perl.sh $(cat /tmp/.perl-version) && \
            rm -rf /tmp/.perl-version /root/.cpanm/
