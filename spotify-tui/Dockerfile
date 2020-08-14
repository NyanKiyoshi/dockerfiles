FROM alpine

ARG VERSION="0.21.0"

RUN build_deps='\
    cargo \
    build-base \
    tar \
    python3 \
    pkgconf \
    xcb-util-renderutil \
    openssl-dev \
    libxcb-dev \
    xcb-util-image-dev \
    xcb-util-renderutil-dev \
    xcb-util-dev \
    musl-utils \
    ' \
    && runtime_deps=' \
    curl \
    libxcb \
    gcc6 \
    ' \
    && set -x \
    && apk add ${build_deps} ${runtime_deps} \
    && curl -sSLo /tmp/release.tar.gz "https://github.com/Rigellute/spotify-tui/archive/v$VERSION.tar.gz" \
    && mkdir /tmp/build \
    && tar --strip-components=1 -xvf /tmp/release.tar.gz -C /tmp/build \
    && cd /tmp/build \
    && ls -la \
    && cargo build --release --target-dir /tmp/build/app \
    && ls -la /app \
    && echo -e '#!/bin/sh\n' > /usr/bin/xdg-open && chmod 755 /usr/bin/xdg-open \
    && apk del ${build_deps} \
    && mv /tmp/build/app/release/spt /usr/bin && rm -R /app /tmp/build /tmp/*.tar.gz \
    && rm -R /tmp/build

# If in need of debugging for OS Errors:
#   strace -f -t -e trace=file /usr/bin/spt
ENTRYPOINT [ "/usr/bin/spt" ]
