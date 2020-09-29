FROM archlinux:latest

WORKDIR /app

COPY deployment.sh /app/init.sh

RUN ["/bin/chmod", "+x", "/app/init.sh"]
RUN ["/bin/pacman", "-S", "--needed", "--noconfirm", "git"]

ENTRYPOINT ["/app/init.sh"]
