FROM alpine:3.21.3

RUN apk add --no-cache sudo build-base git bash python3 cmake wget \
    xfce4 xfce4-terminal xrandr \
    firefox tigervnc nano \
    && adduser -h /home/alpine -s /bin/bash -S -D alpine && echo -e "alpine\nalpine" | passwd alpine \
    && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && git clone --depth 1 https://github.com/novnc/noVNC /opt/noVNC \
    && git clone --depth 1 https://github.com/novnc/websockify /opt/noVNC/utils/websockify \
    && rm -rf /var/cache/apk/* /root/.cache /tmp/*

USER alpine
WORKDIR /home/alpine

RUN mkdir -p /home/alpine/.vnc \
    && echo -e "-Securitytypes=none" > /home/alpine/.vnc/config \
    && echo -e "#!/bin/bash\nstartxfce4 &" > /home/alpine/.vnc/xstartup \
    && echo -e "alpine\nalpine\nn\n" | vncpasswd

USER root

COPY scripts /scripts

USER alpine

ENTRYPOINT [ "/bin/bash", "/scripts/entrypoint" ]
