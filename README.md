# xfce-novnc

A lightweight noVNC server based on an Alpine Linux image with XFCE4.

## Features
- Lightweight and minimal
- XFCE4 desktop environment
- Access via noVNC (web-based VNC client)
- Based on Alpine Linux for a small footprint

## Build the Docker Image
To build the Docker image, use the following command:

```sh
docker build -t tibhome/xfce-novnc:main .
```

## Run the Container
To run the container, execute:

```sh
docker run -d \
           -p 6080:6080 \
           --name xfce-novnc \
           tibhome/xfce-novnc:main
```

## Access the noVNC Interface
Once the container is running, access the noVNC web interface by navigating to:

```
http://localhost:6080/vnc_lite.html
```

## Stop and Remove the Container
To stop the container:

```sh
docker stop xfce-novnc
```

To remove the container:

```sh
docker rm xfce-novnc
