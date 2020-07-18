# vanilla-minecraft-docker

A hassle free docker image that allows running a vanilla Minecraft server in no time. For Linux.

*For PaperMc Minecraft server, visit - [Docker Hub page](https://hub.docker.com/r/layoutxml/papermc-docker), [GitHub page](https://github.com/LayoutXML/papermc-docker).*

## Usage

To use the latest stable version of Minecraft, run
```
sudo docker run -p 25565:25565 -v /root/minecraft_server:/minecraft_server -d -ti --restart unless-stopped -e EULA=true layoutxml/vanilla-minecraft-docker
```

## Options

### Arguments

The following arguments can be passed at build time as build arguments (``--build-arg EULA=true``) or at the run time as environment variables (``-e EULA=true``). They will be saved and remembered for each subsequent run, unless conflicting argument is passed.

Name|Default value|Note
-|-|-
**EULA**|**false**|**You must agree to Minecraft's EULA**
JDK_VERSION|14-slim|This is the latest currently allowed OpenJDK version. Feel free to change it in the future. This argument can only be used as a build argument.
FOLDER_NAME|minecraft_server|Useful to change when running multiple servers.
MINECRAFT_VERSION||If no version specified, will use the latest stable version.
RAM|1024M|Server RAM. `M` for MB, `G` for GB.
JAVA_ARGS||Additional java args.

### Useful Docker Arguments

Name|Argument|Note
-|-|-
**Port**|**``-p 25565:25565``**|**You must use this argument to map default 25565 port (on the right) to any open port (on the left). Without it, the port will remain closed.**
**Volume**|**``-v /root/minecraft_server:/minecraft_server``**|**You must use this argument to map default ``minecraft_server`` folder to a folder on your machine. Without it, the data will be lost when container stops.**
Detached|``-d``|Run docker container in a detached way, allowing use of console for other tasks.
Interactive|``-ti``|Allows interacting with server via commands when container not detached (or reattached via `docker attach` command).
Restart policy|``--restart <type>``|Docker container restart policy. Types: ``no / on-failure / unless-stopped / always``.

## Other Information

[Docker Hub page](https://hub.docker.com/r/layoutxml/vanilla-minecraft-docker)

[GitHub page](https://github.com/LayoutXML/vanilla-minecraft-docker)

### Author

More information about me and my projects: https://rokas.dev

### License

vanilla-minecraft-docker is licensed under "MIT" license. Copyright laws apply.

Copyright © 2020 Rokas Jankūnas (LayoutXML)
