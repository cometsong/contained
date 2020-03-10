FROM cometsong/alpine-dev:3.11.3

ARG vim_feats=huge
ARG py3_ver=3.8
ENV py3_cfg=/usr/lib/python${py3_ver}/config-${py3_ver}-x86_64-linux-gnu
ENV lua_ver=5.3

LABEL app.name="vim"
LABEL app.desc="Vim! 'Nuf said."
LABEL app.site="https://github.com/vim/vim"
LABEL maintainer="cometsong <benjamin at cometsong dot net>"

WORKDIR /tmp

RUN \
# build latest vim with specific options
    git clone https://github.com/vim/vim && \
    cd vim && \
    ./configure \
    --enable-terminal        \
    --enable-gui=gtk3        \
    --enable-fontset         \
    \
    --enable-fail-if-missing \
    \
    --disable-netbeans       \
    --disable-arabic         \
    --disable-farsi          \
    --disable-rightleft      \
    \
    --enable-luainterp \
    --with-lua-prefix=/usr/lua${lua_ver} \
    --enable-perlinterp \
    --enable-rubyinterp \
    --enable-python3interp \
    --with-python3-config-dir=${py3_cfg} \
    \
    --with-features=${vim_feats} \
    --with-compiledby=cometsong && \
    \
    make && \
    make install && \
# cleanup
    cd /tmp 
    #&& rm -rf vim
    #&& \
    #apk-pkg-cleanup

ENTRYPOINT ["vim"]
CMD ["--version"]

#  vim: set ft=Dockerfile ts=4 sw=0 tw=100 et fdm=manual:
