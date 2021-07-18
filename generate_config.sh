#!/bin/bash
echo '############################################################################'
echo '############################# System Variables #############################'
echo '############################################################################'

echo 'These variables are used to define the user and group'
echo 'for all of the containers to ensure that the files will be accessable from every container.'
echo 'Replace the "1000" with the desired PUID and GUID.'
echo '(Recomended to keep it at "1000" if you are not sure what this is)'
DETECTED_UID=$(id -u)
DETECTED_GID=$(id -g)
read -p "Enter User ID: " -e -i "${DETECTED_UID}" USER_ID
read -p "Enter Group ID: " -e -i "${DETECTED_GID}" GROUP_ID

echo '############################################################################'

echo 'This variable is used to define the Time Zone the containers will use.'
DETECTED_TZ=$(cat /etc/timezone)
read -p "Enter Time Zone: " -e -i "${DETECTED_TZ}" TIME_ZONE

echo '############################################################################'

echo 'This variable is used to define the name of the network the containers will use.'
echo "You don't need to create the network manually, docker-compose will create it for you and connect all of the containers on it."
echo 'Replace "hms-network" with the desired name of your network. !!! DO NOT USE A NAME OF A NETWORK THAT ALREADY EXISTS !!!'
read -p "Enter Network Name: " -e -i 'hms-network' NETWORK_NAME

echo '############################################################################'

echo 'This variable is used to set the username for Webmin, the GUI for Filemin and Samba.'
echo 'If for any reason you remove this variable, the default username will be "admin".'
read -p "Enter your Webmin UI username: " -e -i 'admin' WEBMIN_LOGIN

echo '############################################################################'

echo 'This variable is used to set the password for Webmin, the GUI for Filemin and Samba.'
echo 'If for any reason you remove this variable, the default password will be "admin".'
echo 'It is strongly recomended that you change the default password here.'
read -p "Enter your Webmin UI password: " -e -i 'admin' WEBMIN_PASSWORD

echo '############################## Global Volumes ##############################'
echo '########################## ..::USE FULL PATHS::.. ##########################'
echo '#####    NOTE: The paths you provide bellow are paths on your host.    #####'
echo '#####    The containers will use these folders to save your files.     #####'
echo '############################################################################'

echo 'This will be your main sharing folder. All the folders that you specify bellow must be located under this folder.'
read -p "Enter the location of your Main Sharing Folder: " -e -i '/mnt' ROOT_SHARE_FOLDER

echo '############################################################################'

echo 'This is the folder where your downloads will be stored.'
echo 'Replace "/mnt/media/downloads" with the path to your /downloads folder.'
read -p "Enter the location of your Downloads Folder: " -e -i '/mnt/media/downloads' DOWNLOADS_FOLDER

echo '############################################################################'

echo 'This is the folder where your completed downloads will be stored.'
echo 'Replace "/mnt/media/downloads/complete" with the path to your /downloads/complete folder.'
read -p "Enter the location of your Completed Downloads Folder: " -e -i '/mnt/media/downloads/complete' COMPLETED_DOWNLOADS_FOLDER

echo '############################################################################'

echo 'This is the folder where your music files will be stored.'
echo 'Replace "/mnt/media/music/" with the path to your music folder.'
read -p "Enter the location of your Music Folder: " -e -i '/mnt/media/music/' MUSIC_FOLDER

echo '############################################################################'

echo 'This is the folder where your TV Shows will be stored.'
echo 'Replace "/mnt/media/tv" with the path to your TV shows folder.'
read -p "Enter the location of your TV Shows Folder: " -e -i '/mnt/media/tv/' TV_FOLDER

echo '############################################################################'

echo 'This is the folder where your movies will be stored.'
echo 'Replace "/mnt/media/movies" with the path to your movies folder.'
read -p "Enter the location of your Movies Folder: " -e -i '/mnt/media/movies/' MOVIES_FOLDER

echo '############################################################################'

echo 'This is the folder where your video files will be stored.'
echo 'Replace "/mnt/media/videos" with the path to your videos folder.'
read -p "Enter the location of your Videos Folder: " -e -i '/mnt/media/videos/' VIDEOS_FOLDER

echo '############################################################################'

echo 'This is the folder where your torrent files will be stored.'
echo 'Replace "/mnt/media/torrents" with the path to your torrents folder.'
read -p "Enter the location of your Torrents Folder: " -e -i '/mnt/media/torrents/' TORRENTS_FOLDER

echo '############################################################################'

echo 'This is the folder where your books will be stored.'
echo 'Replace "/mnt/media/books" with the path to your books folder.'
read -p "Enter the location of your Books Folder: " -e -i '/mnt/media/books/' BOOKS_FOLDER

echo '############################################################################'

echo 'This is the folder where your comics will be stored.'
echo 'Replace "/mnt/media/comics" with the path to your comics folder.'
read -p "Enter the location of your Comics Folder: " -e -i '/mnt/media/comics/' COMICS_FOLDER

cat << EOF > env.conf
############################################################################
############################# System Variables #############################
############################################################################

# These variables are used to define the user and group
# for all of the containers to ensure that the files will be accessable from every container.
# Replace the "1000" with the desired PUID and GUID.
# (Recomended to keep it at "1000" if you are not sure what this is)
USER_ID=${USER_ID}
GROUP_ID=${GROUP_ID}

# This variable is used to define the Time Zone the containers will use.
TIME_ZONE=${TIME_ZONE}

# This variable is used to define the name of the network the containers will use.
# You don't need to create the network manually, docker-compose will create it for you and connect all of the containers on it.
# Replace "hms-network" with the desired name of your network. !!! DO NOT USE A NAME OF A NETWORK THAT ALREADY EXISTS !!!
NETWORK_NAME=${NETWORK_NAME}

# These variables are used to set the username and password for Webmin, the GUI for Filemin and Samba.
# If for any reason you remove these variables, the default username and password will be "admin".
# It is strongly recomended that you change the default username and password here.
WEBMIN_LOGIN=${WEBMIN_LOGIN}
WEBMIN_PASSWORD=${WEBMIN_PASSWORD}

############################## Global Volumes ##############################
########################## ..::USE FULL PATHS::.. ##########################
#####    NOTE: The paths you provide bellow are paths on your host.    ##### 
#####    The containers will use these folders to save your files.     #####
############################################################################

# This will be your main sharing folder. All the folders that you specify bellow must be located under this folder.
ROOT_SHARE_FOLDER=${ROOT_SHARE_FOLDER}

# This is the folder where your downloads will be stored.
# Replace "/mnt/media/downloads" with the path to your /downloads folder.
DOWNLOADS_FOLDER=${DOWNLOADS_FOLDER}

# This is the folder where your completed downloads will be stored.
# Replace "/mnt/media/downloads/complete" with the path to your /downloads/complete folder.
COMPLETED_DOWNLOADS_FOLDER=${COMPLETED_DOWNLOADS_FOLDER}

# This is the folder where your music files will be stored.
# Replace "/mnt/media/music/" with the path to your music folder.
MUSIC_FOLDER=${MUSIC_FOLDER}

# This is the folder where your TV Shows will be stored.
# Replace "/mnt/media/tv" with the path to your TV shows folder.
TV_FOLDER=${TV_FOLDER}

# This is the folder where your movies will be stored.
# Replace "/mnt/media/movies" with the path to your movies folder.
MOVIES_FOLDER=${MOVIES_FOLDER}

# This is the folder where your video files will be stored.
# Replace "/mnt/media/videos" with the path to your videos folder.
VIDEOS_FOLDER=${VIDEOS_FOLDER}

# This is the folder where your torrent files will be stored.
# Replace "/mnt/media/torrents" with the path to your torrents folder.
TORRENTS_FOLDER=${TORRENTS_FOLDER}

# This is the folder where your books will be stored.
# Replace "/mnt/media/books" with the path to your books folder.
BOOKS_FOLDER=${BOOKS_FOLDER}

# This is the folder where your comics will be stored.
# Replace "/mnt/media/comics" with the path to your comics folder.
COMICS_FOLDER=${COMICS_FOLDER}

##############################################################################
####################### Application Specific Settings ########################
#### With the variables bellow you can specify the name of the container #####
################ and the ports the applications will use. ####################
##############################################################################

# Samba - File Sharing Server
CONTAINER_NAME_SAMBA=smb-webmin
SAMBA_WEBUI_PORT=5000
SAMBA_HOSTNAME=samba.example.com

# Nginx Proxy Manager Dashboard port
# Replace 8181 with the port that you want your Nginx Proxy Manager Dashboard to be accessable on.
CONTAINER_NAME_NPM=nginx-proxy-manager
NPM_DASH_PORT=8181

# Lidarr - Music Manager
CONTAINER_NAME_LIDARR=lidarr
LIDARR_PORT=8686

# Bazarr - Subtitles Manager
CONTAINER_NAME_BAZARR=bazarr
BAZARR_PORT=6767

# Deluge - BitTorrent Client
CONTAINER_NAME_DELUGE=deluge
DELUGE_PORT=8112

# Jellyfin - Media Player
CONTAINER_NAME_JELLYFIN=jellyfin
JELLYFIN_PORT=8096

# Jackett - Torrent Indexer
CONTAINER_NAME_JACKETT=jackett
JACKETT_PORT=9117

# Portainer - Docker Manager
CONTAINER_NAME_PORTAINER=portainer
PORTAINER_PORT=9000

# Radarr - Movies Manager
CONTAINER_NAME_RADARR=radarr
RADARR_PORT=7878

# Sonarr - TV Shows Manager
CONTAINER_NAME_SONARR=sonarr
SONARR_PORT=8989

# MeTube - YouTube Downloader
CONTAINER_NAME_METUBE=metube
METUBE_PORT=8081

# MusicBrainz Picard - Music Tagger
CONTAINER_NAME_PICARD=picard
PICARD_PORT=5800

# Heimdall - Access Dashboard
CONTAINER_NAME_HEIMDALL=heimdall
HEIMDALL_PORT=9983

# Filemin - File Manager
CONTAINER_NAME_FILEMIN=filemin
FILEMIN_PORT=3333

# Readarr - Books Manager
CONTAINER_NAME_READARR=readarr
READARR_PORT=8787

# Ubooquity - Books & Comics Reader
CONTAINER_NAME_UBOOQUITY=ubooquity
UBOOQUITY_WEBUI_PORT=2202
UBOOQUITY_ADMIN_PORT=2203
MAX_MEM=512

EOF
