# Applications and Ports

| Application  | Ports |
| ------------- | ------------- |
| Samba - File sharing server  | 5000  |
| Nginx Proxy Manager  | 8181  |
| Lidarr - Music Manager  | 8686  |
| Bazarr - Subtitles Manager  | 6767  |
| Deluge - BitTorrent Client  | 8112  |
| Jellyfin - Media Player  | 8096  |
| Jackett - Torrent Indexer  | 9117  |
| Portainer - Docker Manager  | 9000  |
| Radarr - Movies Manager  | 7878  |
| Sonarr - TV Shows Manager  | 8989  |
| MeTube - YouTube Downloader  | 8081  |
| MusicBrainz Picard - Music Tagger  | 5800  |
| Heimdall - Access Dashboard  | 9983  |
| Filemin - File Manager  | 3333  |
| Readarr - Books Manager  | 8787  |
| Ubooquity - Books & Comics Reader  | WEBUI:2202 / AdminUI:2203  |

## Hardcoded ports
The following ports are hardcoded in the docker-compose.yml file and should **NOT** be changed.

1. Ports 80 and 443 are used by Nginx Proxy Manager to acctually be able to do it's job as a proxy server.
2. Ports 137,138,139,445 are used by Samba to serve files on the network.

**NOTE: DO NOT CHANGE THESE PORTS. STUFF WILL BREAK**