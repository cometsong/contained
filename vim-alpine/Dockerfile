FROM cometsong/alpine-dev:latest

#container: vim-base

ARG vim_feats=huge
ARG py3_ver=3.8
ENV py3_config /usr/lib/python${py3_ver}/config-${py3_ver}-x86_64-linux-gnu

LABEL app.name="vim"
LABEL app.desc="Vim! 'Nuf said."
LABEL app.site="https://github.com/vim/vim"
LABEL maintainer="cometsong <benjamin at cometsong dot net>"

WORKDIR /tmp

RUN \
    cd /tmp && \
# build latest vim with specific options
    git clone https://github.com/vim/vim && \
    cd vim && \
    ./configure \
    --enable-fail-if-missing \
    --disable-netbeans \
    --enable-multibyte \
    --enable-terminal \
    --enable-gui=gtk3 \
    \
    --enable-luainterp \
    --with-lua-prefix=/usr/lua5.3 \
    --enable-perlinterp \
    --enable-rubyinterp \
    --enable-python3interp \
    --with-python3-config-dir=${py3_config} \
    \
    --with-features=${vim_feats} \
    --with-compiledby=cometsong && \
    make install

# cleanup
#RUN \
#    cd /tmp && \
#    rm -rf vim

ENTRYPOINT ["vim"]

#  vim: set ft=Dockerfile ts=4 sw=0 tw=100 et fdm=manual:
