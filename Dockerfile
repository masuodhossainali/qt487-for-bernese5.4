# Qt 4.8.7 + Qt3Support – self-contained (bundled libpng)
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV QT_VERSION=4.8.7
ENV QT_SRC_DIR=/tmp/qt-everywhere-opensource-src-${QT_VERSION}
ENV QT_PREFIX=/opt/qt4.8.7

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential g++ make perl python \
        libfontconfig1-dev libfreetype6-dev \
        libx11-dev libxext-dev libxrender-dev libxi-dev \
        libxcursor-dev libxfixes-dev libxrandr-dev libxinerama-dev \
        libsm-dev libice-dev \
        libgl1-mesa-dev libglu1-mesa-dev \
        libdbus-1-dev libssl-dev zlib1g-dev \
        wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget -q https://download.qt.io/archive/qt/4.8/${QT_VERSION}/qt-everywhere-opensource-src-${QT_VERSION}.tar.gz \
    && tar -xzf qt-everywhere-opensource-src-${QT_VERSION}.tar.gz \
    && rm qt-everywhere-opensource-src-${QT_VERSION}.tar.gz

WORKDIR ${QT_SRC_DIR}

# -qt-libpng → use Qt’s own libpng (no external libpng12 dependency)
# -no-openssl -no-script → avoid known build failures
RUN ./configure \
        -opensource -confirm-license \
        -prefix ${QT_PREFIX} \
        -release -shared \
        -nomake examples -nomake demos -nomake docs \
        -no-webkit -no-phonon -no-openssl -no-script -no-scripttools \
        -opengl desktop \
        -dbus \
        -fontconfig -system-freetype \
        -qt-libpng \
        -no-rpath \
        -I/usr/include/freetype2 \
    && make -j$(nproc) \
    && make install \
    && rm -rf ${QT_SRC_DIR}

ENV PATH="${QT_PREFIX}/bin:${PATH}"
ENV LD_LIBRARY_PATH="${QT_PREFIX}/lib"
ENV QTDIR=${QT_PREFIX}
ENV QT_PLUGIN_PATH=${QT_PREFIX}/plugins

RUN useradd -m -s /bin/bash bernese && chown -R bernese:bernese ${QT_PREFIX}
USER bernese
WORKDIR /home/bernese
CMD ["qmake", "-v"]
