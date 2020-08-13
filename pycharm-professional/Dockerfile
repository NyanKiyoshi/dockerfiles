FROM debian:bullseye-slim

LABEL maintainer="KOCAK Mikael <hello@vanille.bid>"
LABEL description="Python IDE for Professional Developers. Professional Edition."
LABEL website="https://keepassxc.org/"

ENV PYCHARM_VERSION="2020.2"

RUN buildDeps=' \
        curl \
    ' \
    runtimeDeps='\
        git \
        ca-certificates \
        python3 \
        python3-venv \
        x11-utils \
    ' \
    set -x \
    && apt update \
    && apt install -y $buildDeps $runtimeDeps --no-install-recommends \
    && curl -sSLo /tmp/src.tar.gz "https://download-cf.jetbrains.com/python/pycharm-professional-${PYCHARM_VERSION}.tar.gz" \
    && mkdir -m 755 /app \
    && cd /app \
    && tar --strip-components=1 -xvf /tmp/src.tar.gz -C ./ \
    && ls -la \
    && apt autoremove -y $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Build complete."

ENTRYPOINT [ "/app/bin/pycharm.sh" ]