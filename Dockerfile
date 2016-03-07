FROM alpine:edge

RUN apk --update add erlang erlang-sasl erlang-crypto erlang-syntax-tools imagemagick && rm -rf /var/cache/apk/*

ENV APP_NAME kitteh
ENV APP_VERSION "0.0.1"
ENV PORT 4000

RUN mkdir -p /$APP_NAME
ADD rel/$APP_NAME/bin /$APP_NAME/bin
ADD rel/$APP_NAME/lib /$APP_NAME/lib
ADD rel/$APP_NAME/releases/start_erl.data                 /$APP_NAME/releases/start_erl.data
ADD rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.sh      /$APP_NAME/releases/$APP_VERSION/$APP_NAME.sh
ADD rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.boot    /$APP_NAME/releases/$APP_VERSION/$APP_NAME.boot
ADD rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.rel     /$APP_NAME/releases/$APP_VERSION/$APP_NAME.rel
ADD rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.script  /$APP_NAME/releases/$APP_VERSION/$APP_NAME.script
ADD rel/$APP_NAME/releases/$APP_VERSION/start.boot        /$APP_NAME/releases/$APP_VERSION/start.boot
ADD rel/$APP_NAME/releases/$APP_VERSION/sys.config        /$APP_NAME/releases/$APP_VERSION/sys.config
ADD rel/$APP_NAME/releases/$APP_VERSION/vm.args           /$APP_NAME/releases/$APP_VERSION/vm.args

EXPOSE $PORT

CMD trap exit TERM; /$APP_NAME/bin/$APP_NAME foreground & wait
