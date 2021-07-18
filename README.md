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
18. Readarr - Books Manager
19. Ubooquity - Books & Comics Reader

You can see a list of all services and the ports they are using [here](docs/ports.md).

## Updates
Updates have been moved to [CHANGELOG.md](CHANGELOG.md).

## TO-DO
The TO-DO list has been moved to [TODO.md](TODO.md).

