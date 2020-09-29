FROM archlinux:latest

WORKDIR /app

COPY deployment.sh /app/init.sh

RUN ["/bin/chmod", "+x", "/app/init.sh"]

ENTRYPOINT ["/app/init.sh"]
