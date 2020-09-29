FROM alpine:3.10

WORKDIR /github/workspace

COPY init.sh /github/workspace/init.sh

RUN ["/bin/chmod", "+x", "/github/workspace/init.sh"]

ENTRYPOINT ["/github/workspace/init.sh"]
