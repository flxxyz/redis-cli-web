FROM alpine

ENV GOPATH "/opt/redis-cli-web"

WORKDIR $GOPATH

RUN echo 'https://mirrors.aliyun.com/alpine/v3.9/main/' > /etc/apk/repositories; \
    echo 'https://mirrors.aliyun.com/alpine/v3.9/community/' >> /etc/apk/repositories; \
    apk add --no-cache musl-dev git go; \
    go version; \
    git config --global http.sslVerify false; \
    go get -u -v -ldflags "-s -w" github.com/yudai/gotty; \
    go get -u -v -ldflags "-s -w" github.com/holys/redis-cli; \
    rm -rf ${GOPATH}/src ${GOPATH}/pkg /var/cache/apk /usr/share/man; \
    apk del git go

ENV PATH $GOPATH/bin:$PATH

EXPOSE 7070

ENTRYPOINT ["gotty", "-p", "7070", "-w", "redis-cli"]
