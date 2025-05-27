# Docker image for ImapTest

## Overview

This creates an unofficial Docker image of ImapTest, an IMAP server tester
from the Dovecot project. The image is published at
https://hub.docker.com/repository/docker/jheiss/imaptest

ImapTest is an integration and stress tester for IMAP servers, developed as part of the Dovecot project.

Integration tests:

```
docker run -it jheiss/imaptest \
    host=imap.example.com port=143 \
    user=user@example.com pass=abc123 \
    ssl=any-cert \
    test=/usr/local/share/imaptest/tests
```

Stress tests:

```
docker run -it jheiss/imaptest \
    host=imap.example.com port=143 \
    user=user@example.com pass=abc123 \
    ssl=any-cert \
    mbox=/usr/local/share/imaptest/dovecot-crlf
```

See the ImapTest documentation for more details: https://dovecot.github.io/imaptest/

## Image

The image is automatically built once a week using GitHub Actions via the
configuration in this repository from the dovecot "Latest Release" binaries
provided by upstream at https://github.com/dovecot/imaptest/releases.
