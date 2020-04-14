# Minecraft Bedrock Server for Docker

This docker image provides a Minecraft Bedrock Server that will download the selected version at startup.

To start it, run

    docker run -d -e VERSION=<version> -p 19132:19132/udp darealromz/minecraft-bedrock:latest

At the time of writing, the version was 1.14.32.1

## Run commands in the Minecraft servers

You can send commands in the server by calling

    docker exec <container> send.sh <command>

example:

    docker exec minecraft send.sh op DaRealRomz

## Attaching data directory to host filesystem

In order to readily access the Minecraft data, use the `-v` argument
to map a directory on your host machine to the container's `/minecraft/data` directory, such as:

    docker run -d -v /path/on/host:/minecraft/data ...

When attached in this way you can stop the server, edit the configuration under your attached `/path/on/host`
and start the server again with `docker start <container>` to pick up the new configuration.

## Issues

If you have any problems with or questions about this image, please contact me by submitting a ticket through a [GitHub issue](https://github.com/DaRealRomz/docker-minecraft-bedrock/issues)
