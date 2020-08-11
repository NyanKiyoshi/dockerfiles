FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y \
        curl \
        gcc \
        zlib1g-dev \
        unzip \
        ca-certificates \
        libfuse2 \
        libglib2.0-0 \
        libx11-6 \
        libx11-xcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        x11-xserver-utils \
        libnss3 \
        libgdk-pixbuf2.0-0 \
        libgtk-3-0 \
        alsa-tools \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV CLICKUP_VERSION 2.0.16

# Download the source's zipped AppImage
RUN curl -sSL "https://attachments3.clickup.com/desktop/clickup-desktop-${CLICKUP_VERSION}-linux.zip" -o /tmp/clickup.zip \
    && unzip /tmp/clickup.zip \
    && mv clickup*x86_64.AppImage /clickup.AppImage \
    && rm -rf /tmp/*.zip /tmp/*.AppImage

# This will run the AppImage and extract it before running it.
# It will also prevent Electron to try to run as root using "--no-sandbox"
ENTRYPOINT [ "/clickup.AppImage" ]
CMD [ "--appimage-extract-and-run", "--no-sandbox" ]
