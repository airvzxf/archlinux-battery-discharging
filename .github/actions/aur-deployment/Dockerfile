FROM archlinux:latest

WORKDIR /app

COPY deployment.sh /app/init.sh

RUN ["/bin/chmod", "+x", "/app/init.sh"]

RUN pacman -Sy --noconfirm &&\
    pacman -S pacman --noconfirm &&\
    pacman-db-upgrade &&\
    pacman -S --noconfirm base-devel openssh git

ENTRYPOINT ["/app/init.sh"]
