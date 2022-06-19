# HMS-Docker
Home Media Server setup using Docker.
This is achieved through the use of Docker Compose

## Requirements
1. Any Linux OS that supports Docker. (I haven't tested this on Windows - it might work)
2. Latest Docker Engine for your OS.
3. Latest Docker Compose for your OS.

## Install Guide
#### Ubuntu x64:

**NOTE: This is only for a fresh install on Ubuntu x64**

If you are running Ubuntu x64 you can use the install.sh script to install Docker, setup some basic folder structures and start all of the services.
1. Make the file executable.
```console
    chmod +x install.sh
```
2. Edit the .env file.
You can also use the generate_config.sh script file to automate this process.
Keep in mind that using the script will overwrite any previous changes you might have made to the .env file manually.
Before using the script make sure to make it an executable.
```console
    chmod +x generate_config.sh
```
4. ***Optional*** Use the generate_oauth2_config.sh script to generete the OAuth2-Proxy configuration file.
Use the script ONLY if the authentication provider will be Azure Active Directory, otherwise edit the file manually.
Running the script will overwrite any previous changes you might have made to the oauth2-proxy.cfg file manually.
If you do not need 2FA Authentication, you can comment out the OAuth2-Proxy and Redis services from the docker-compose.yml file.
Keep in mind, you will need to manually add the code from the npm_snip_oauth2.conf file to every service that will be protected with 2FA. You can do this in the Advanced tab of a Proxy Host in the Nginx Proxy Manager.
Before running the script make sure to make it an executable.
```console
    chmod +x generate_oauth2_config.sh
```
3. Run the install script.
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
6. ~~Jackett - Torrent Indexer~~
7. Portainer - Docker Manager
8. Radarr - Movies Manager
9. Sonarr - TV Shows Manager
10. ~~MeTube - YouTube Video Downloader~~
11. YouTube Downloader - Material
12. Watchtower - Docker Container Update Service
13. ~~MusicBrainz Picard - Music Tagger~~
14. ~~Organizr - Access Dashboard~~
15. Heimdall - Access Dashboard
16. Nginx Proxy Manager
17. Samba WebUI
18. Filemin - File Manager
19. Readarr - Books Manager
20. Ubooquity - Books & Comics Reader
21. Deemix - Deezer Music Downloader
22. Syncthing - Sync Manager
23. OAuth2-Proxy - Authentication Provider
24. Redis - Database and Cache (used by OAuth2-Proxy)
25. Prowlarr - Torrent Indexer

You can see a list of all services and the ports they are using [here](docs/ports.md).

## Updates
Updates have been moved to [CHANGELOG.md](CHANGELOG.md).

## TO-DO
The TO-DO list has been moved to [TODO.md](TODO.md).

