# Applications and Ports

| Application  | Ports |
| ------------- | ------------- |
| Samba - File sharing server  | 5000  |
| Nginx Proxy Manager  | 8181  |
| Lidarr - Music Manager  | 8686  |
| Bazarr - Subtitles Manager  | 6767  |
| Deluge - BitTorrent Client  | 8112  |
| Jellyfin - Media Player  | 8096  |
| Prowlarr - Torrent Indexer  | 9696  |
| Portainer - Docker Manager  | 9000  |
| Radarr - Movies Manager  | 7878  |
| Sonarr - TV Shows Manager  | 8989  |
| YTDLM - YouTube Downloader  | 17442  |
| Heimdall - Access Dashboard  | 9983  |
| Filemin - File Manager  | 3333  |
| Readarr - Books Manager  | 8787  |
| Ubooquity - Books & Comics Reader  | WEBUI:2202 / AdminUI:2203  |
| Deemix - Deezer Music Downloader | 6595 |
| Syncthing - Sync Manager | WEBUI:8384 / SYNC_PORT1:21027 / SYNC_PORT2:22000 |
| OAuth2-Proxy - Authentication Provider | PORT1:8080 / PORT2:4180 |
| Redis - Database and Cache (used by OAuth2-Proxy) | 6379 |

## Hardcoded ports
The following ports are hardcoded in the docker-compose.yml file and should **NOT** be changed.

1. Ports 80 and 443 are used by Nginx Proxy Manager to acctually be able to do it's job as a proxy server.
2. Ports 137,138,139,445 are used by Samba to serve files on the network.

**NOTE: DO NOT CHANGE THESE PORTS. STUFF WILL BREAK**