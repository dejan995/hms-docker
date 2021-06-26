# HMS-Docker
Home Media Server setup using Docker.
This is achieved through the use of Docker Compose

## Requirements
1. Any Linux OS that supports Docker. (I haven't tested this on Windows - it might work)
2. Latest Docker Engine for your OS.
3. Latest Docker Compose for your OS.

## Install Guide
#### Ubuntu:

**NOTE: This is only for a fresh install on Ubuntu**

If you are running Ubuntu you can use the install.sh script to install Docker, setup some basic folder structures and start all of the services.
1. Make the file executable.
```console
    chmod +x install.sh
```
2. Edit the .env file.
3. Run the script.
```console
    ./install.sh
``` 

For more instructions go to the [Manual](docs/MANUAL.md).

#### Other Operating Systems:
Everything that you need to edit is inside the .env file. You don't need to edit anything inside the docker-compose.yml file (only if you want all of the services provided, otherwise you will need to comment out the applications you don't want inside the docker-compose file).

For more instructions go to the [Manual](docs/MANUAL.md).

After you are done editing the .env file you can start the stack using the following command.
```console
    docker-compose up -d
```
    
**NOTE: Keep in mind that none of the applications are configured. You will have to go one by one and configure them to your specific needs.**

For more instructions go to the [Manual](docs/MANUAL.md).

## List of Applications
1. Lidarr - Music Manager
2. Bazarr - Subtitles Manager
3. Deluge - BitTorrent Client
4. ~~Emby - Media Server~~
5. Jellyfin - Media Server
6. Jackett - Torrent Indexer
7. Portainer - Docker Manager
8. Radarr - Movies Manager
9. Sonarr - TV Shows Manager
10. MeTube - YouTube Video Downloader
11. Watchtower - Docker Container Update Service
12. MusicBrainz Picard - Music Tagger
13. ~~Organizr - Access Dashboard~~
14. Heimdall - Access Dashboard
15. Nginx Proxy Manager
16. Samba WebUI
17. Filemin - File Manager

You can see a list of all services and the ports they are using [here](docs/ports.md).

## Updates
### 26.06.2021
1. Updated Samba Configuration to reflect the updated docker image for it.
2. Updated Filemin Configuration to reflect the updated docker image for it.

### 23.06.2021
1. Fixed issue where the password for the Webmin UI, for Filemin and Samba, was not being changed. You can now set the password from a variable in the ".env" file.
2. Fixed the install.sh script. It can now safely be used on a freshly installed Ubuntu machine.
3. Added generate_config.sh script. With this script you can generate your own .env file.

### 20.06.2021
1. Emby Media server is replaced with Jellyfin Media Server.
2. The Samba Server is hosted on DockerHub, no need to build it locally anymore.
3. Added File managment GUI (Filemin application from Webmin). The way it is setup, it will only provide access to the Root Folder that is set in the .env file.
4. Organizr is replaced with Heimdall.
5. Added an Install Script for Ubuntu users.

## TO-DO
- [x] Make the Install Guide more detailed.
- [ ] Provide configuration instructions for the applications.
- [x] Add Samba Server to the applications provided.

