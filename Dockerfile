FROM debian:13

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    libpcre2-32-0 \
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
