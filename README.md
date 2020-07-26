# HMS-Docker
Home Media Server setup using Docker.
This is achieved through the use of Docker Compose

## Requirements
1. Any Linux OS that supports Docker. (I haven't tested this on Windows - it might work)
2. Latest Docker Engine for your OS.
3. Latest Docker Compose for your OS.

## Install Guide
Everything that you need to edit is inside the .env file. You don't need to edit anything inside the docker-compose.yml file.
After you are done editing the .env file you can start the stack using the following command.

    docker-compose up -d
    
NOTE: Keep in mind that none of the applications are configured. You will have to go one by one and configure them to your specific needs.

## List of Applications
1. Lidarr - Music Manager
2. Bazarr - Subtitles Manager
3. Deluge - BitTorrent Client
4. Emby - Media Server
5. Jackett - Torrent Indexer
6. Portainer - Docker Manager
7. Radarr - Movies Manager
8. Sonarr - TV Shows Manager
9. MeTube - YouTube Video Downloader
10. Watchtower - Docker Container Update Service
11. MusicBrainz Picard - Music Tagger
12. Organizr - Access Dashboard
13. Nginx Proxy Manager
14. Samba WebUI  

## TO-DO
1. Make the Install Guide more detailed.
2. Provide configuration instructions for the applications.
~~3. Add Samba Server to the applications provided.~~
