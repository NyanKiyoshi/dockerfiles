FROM debian:bullseye-slim

LABEL maintainer="KOCAK Mikael <hello@vanille.bid>"
LABEL description="Truly free time tracker for teams, Desktop App."
LABEL vendor_site="https://clockify.me/"

RUN apt update \
    && apt install -y \
        ca-certificates \
        curl \
        libx11-xcb1 \
        alsa-utils \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# 1. We grab the official .deb file from their upstream
# 2. We fetch debian repositories' list of packages
# 3. We install the .deb file we grabbed in (1)
# 4. We tell Aptitude to install the missing dependencies
# 5. We clean up the data
RUN curl -sSLo \
        /tmp/clockify.deb \
        https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.deb \
    && apt update \
    && {\
            dpkg -i /tmp/clockify.deb \
            || echo "Ignored the error: most likely missing deps. They will be installed next" > 2; \
    } \
    && apt -yf install \
    && which clockify \
    && echo "Installed Clockify: $(dpkg-deb -I /tmp/clockify.deb | grep Version | sed -E 's/.*:\s//')" \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/*.deb

ENTRYPOINT [ "/usr/local/bin/clockify" ]
