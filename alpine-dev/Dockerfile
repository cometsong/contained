FROM alpine:latest

LABEL app.name="alpine-dev"
LABEL app.desc="Alpine based development environment"
LABEL maintainer="cometsong <benjamin at cometsong dot net>"

WORKDIR /tmp

RUN \
# add runtime and build dependencies
    apk update && \
    apk --no-cache add \
        bash        \
        libxml2     \
        gtk+3.0     \
        sqlite      \
        man         \
        man-pages   \
        less        \
        gzip        \
        bzip2       \
        zip         \
        zlib        \
        \
        go          \
        perl        \
        python3     \
        ruby        \
        lua5.3      \
        lua5.3-stdlib  \
        lua5.3-libs    \
        lua5.3-cliargs \
        lua5.3-sqlite  \
        jq    \
        git   \
        yaml  \
        fzf   \
        ctags \
    --virtual build-deps \
        build-base  \
        autoconf    \
        automake    \
        gtk+3.0-dev \
        libx11-dev  \
        libxml2-dev \
        libxpm-dev  \
        libxt-dev   \
        musl-dev    \
        ncurses-dev \
        yaml-dev    \
        sqlite-dev  \
        lua5.3-dev  \
        perl-dev    \
        python3-dev \
        ruby-dev

# cleanup script can be used in child containers
RUN \
    echo "apk cache clean; apk del build-deps;" \
    > /usr/bin/apk-pkg-cleanup \
    && chmod +x /usr/bin/apk-pkg-cleanup

#  vim: set ft=Dockerfile ts=4 sw=0 tw=100 et fdm=manual:
