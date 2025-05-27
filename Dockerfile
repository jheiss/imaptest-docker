# ImapTest currently only provides an aarch64 build for Debian 13, which
# hasn't been released yet. So we use the named "trixie" tag until 13 is
# released.
FROM debian:trixie

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN \
  curl -L -o /usr/local/bin/imaptest https://github.com/dovecot/imaptest/releases/download/latest/imaptest-$(uname -m)-debian-13 \
  && chmod 755 /usr/local/bin/imaptest

RUN \
  cd /tmp \
  && git clone https://github.com/dovecot/imaptest.git \
  && mkdir /usr/local/share/imaptest \
  && mv imaptest/src/tests /usr/local/share/imaptest \
  && rm -rf imaptest
RUN \
  cd /usr/local/share/imaptest \
  && curl -OL http://www.dovecot.org/tmp/dovecot-crlf

ENTRYPOINT ["/usr/local/bin/imaptest"]
