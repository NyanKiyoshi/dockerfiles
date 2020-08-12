# Original work was made by Christian Koep. Shout out to them!
FROM alpine:latest

LABEL maintainer="KOCAK Mikael <hello@vanille.bid>"
LABEL description="Cross-platform community-driven port of Keepass password manager."
LABEL website="https://keepassxc.org/"

ENV KEEPASSXC_VERSION 2.6.0

RUN buildDeps=' \
		automake \
		argon2-dev \
		bash \
		cmake \
		curl-dev \
		expat \
		g++ \
		gcc \
		git \
		libgcrypt-dev \
		libmicrohttpd-dev \
		libqrencode-dev	\
		libsodium-dev \
		make \
		qt5-qtbase-dev \
		qt5-qtsvg-dev \
		qt5-qttools-dev \
		asciidoctor \
	' \
	runtimeDeps='\
		yubico-c-dev \
		ykpers-dev \
    ' \
	set -x \
	&& apk --no-cache add \
		$buildDeps $runtimeDeps \
	&& git clone --depth 1 --branch ${KEEPASSXC_VERSION} https://github.com/keepassxreboot/keepassxc.git /usr/src/keepassxc \
	&& cd /usr/src/keepassxc \
	&& mkdir build \
	&& cd build \
	&& cmake -DWITH_TESTS=ON -DWITH_XC_AUTOTYPE=ON -DWITH_XC_YUBIKEY=ON -DWITH_XC_BROWSER=ON .. \
	&& make \
	&& make install \
	&& apk del $buildDeps \
	&& rm -rf /usr/src/keepassxc \
	&& echo "Build complete."

RUN	apk --no-cache add \
		argon2-libs \
		libcurl \
		libmicrohttpd \
		libgcrypt \
		libqrencode \
		libsodium \
		mesa-dri-intel \
		qt5-qtbase \
		qt5-qtbase-x11 \
		qt5-qtsvg \
		qt5-qttools \
		ttf-dejavu

ENTRYPOINT [ "/usr/local/bin/keepassxc" ]