#FROM alpine:latest
FROM alpine:3.11.3

LABEL app.name="alpine-dev"
LABEL app.desc="Alpine based development environment"
LABEL maintainer="cometsong <benjamin at cometsong dot net>"

WORKDIR /tmp
ENV lua_ver=5.3

RUN \
# add runtime and build dependencies
    apk update && \
    apk --no-cache add \
        bash        \
        libxml2     \
        yaml        \
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
        lua${lua_ver}         \
        lua${lua_ver}-stdlib  \
        lua${lua_ver}-libs    \
        lua${lua_ver}-cliargs \
        lua${lua_ver}-sqlite  \
        jq    \
        git   \
        yaml  \
        fzf   \
        ctags \
        && \
    apk --update --no-cache add \
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
        perl-dev    \
        python3-dev \
        ruby-dev    \
        lua${lua_ver}-dev

# cleanup script can be used in child containers
RUN \
    echo "apk cache clean; apk del build-deps;" \
    > /usr/bin/apk-pkg-cleanup \
    && chmod +x /usr/bin/apk-pkg-cleanup

#  vim: set ft=Dockerfile ts=4 sw=0 tw=100 et fdm=manual:
