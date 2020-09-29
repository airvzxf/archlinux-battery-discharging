FROM alpine:3.10

WORKDIR /app

COPY init.sh /app/init.sh

RUN ["/bin/chmod", "+x", "/app/init.sh"]

ENTRYPOINT ["/app/init.sh"]
