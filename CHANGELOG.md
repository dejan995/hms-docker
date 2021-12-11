# Changelog
## Updates
### 11.12.2021
1. Replaced MeTube with YouTude Downloader - Material.
2. Added ***Deemix*** for music downloading.
3. Added ***Syncthing*** for syncing between local servers as well as remote servers. (The server you are syncing with also must have ***Syncthing*** installed on it.)
4. Added ***OAuth2-Proxy*** for providing more secure authentication.
5. Added ***Redis***, mainly to provide support and stability for ***OAuth2-Proxy***.
6. Added script for generating the OAuth2-Proxy configuration file. (Use it only if the provider is Azure Active Directory)

### 18.07.2021
1. Minor fixes to ***generate_config.sh***.
2. Moved the ***Updates*** section to [CHANGELOG.md](CHANGELOG.md).
3. Moved the ***TO-DO*** section to [TODO.md](TODO.md).

### 05.07.2021
1. Added ***Readarr*** and ***Ubooquity*** for Books support.
2. Changed all support files and documentation to reflect the addition of ***Readarr*** and ***Ubooquity***. 

### 27.06.2021
1. Added option to change the default Webmin Username for Filemin and Samba.

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