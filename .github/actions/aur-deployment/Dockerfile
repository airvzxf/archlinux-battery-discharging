FROM alpine:3.10

WORKDIR /app

COPY init.sh /app/init.sh

RUN ["/bin/chmod", "+x", "/app/init.sh"]

RUN ["/bin/ls", "-lha", "/"]
RUN ["/bin/ls", "-lha", "/app/"]

ENTRYPOINT ["/app/init.sh"]
