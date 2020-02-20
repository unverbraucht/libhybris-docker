#FROM andreilhicas/pipenv:alpine
FROM debian:buster-slim

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen

RUN set -eux; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
           build-essential make gcc g++ procps sed gawk autoconf automake \
           autotools-dev binutils make libtool pkg-config ca-certificates \
            less wget libwayland-client0 libegl1-mesa libegl1-mesa-dev libwayland-dev git ssh joe; \
    \
    # Cleanup the Dockerfile
    apt-get clean && \
    rm -rf /var/lib/apt/lists

COPY android-headers_23.orig.tar.gz /android-headers_23.orig.tar.gz
COPY lib-arm /system/lib

RUN mkdir /src

RUN tar xzf android-headers_23.orig.tar.gz &&\
    mv -f android-headers-23/23 /usr/include/android-headers && \
    rm -rf android-headers_23.orig.tar.gz android-headers-23

RUN cd /src && git clone https://github.com/unverbraucht/libhybris.git && \
    cd /src/libhybris/hybris && \
    ./autogen.sh --with-android-headers=/usr/include/android-headers --prefix=/opt/libhybris --enable-debug  --enable-wayland --enable-wayland_serverside_buffer \
    && make && make install  
# --disable-wayland --disable-wayland_serverside_buffer
