# Editing the .env File
## System Variables
### User and Group ID
This is to ensure that all the files that will be created, downloaded, modified etc., all have the correct permissions.
This is usualy set to be the same as the host system user and is usualy always "1000" for both User ID and Group ID.
In case you are not sure you can use the following command in the terminal to get your current PUID and GUID:
```console
dejan@jupiter:~$ id
uid=1000(dejan) gid=1000(dejan) groups=1000(dejan),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lxd)
```
As you can see my user has UID and GID (these coresspond to PUID and GUID) of "1000", so my .env file will have the following:
```code
USER_ID=1000
GROUP_ID=1000
```

### Time Zone
This is to set the correct Time Zone for the applications that need it.

You can see all available time zones [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). Look in the third column of the table - "TZ database name".

Since I'm in Macedonia I'm using "Europe/Skopje" - Skopje is the capital city of my country.
```code
TIME_ZONE=Europe/Skopje
```

### Network Name
This is to set the name for the Docker Virtual Network.
This one is not really important. You can use anything here.

**NOTE: Do not use the name of an alreay existing Docker Network.**

**ADVICE: Keep this one as is. For better Docker managment down the line, if need it.**
```code
NETWORK_NAME=hms-network
```
## Global Volumes
These are the paths where all of the data will be stored. By default everything is located inside the **/mnt** folder. Inside this folder you will have two additional folders:

1. **/mnt/docker**
2. **/mnt/media**

The **/mnt/docker** folder will contain all of the configuration files for the applications, divided in folders with the application name.

The **/mnt/media** folder will contain all of the media files, divided in folders by the type of media they store.

**NOTE: The folders for the Samba Server need to be created before running the containers.**

**Use the following commands to create them in their default locations. Otherwise change the commands to reflect the folders where you will store the configuration files and also remember to reflect this change in the .env file.**

```console
sudo mkdir -p /mnt/docker/smbwebmin/webmin
sudo mkdir -p /mnt/docker/smbwebmin/samba/etc
sudo mkdir -p /mnt/docker/smbwebmin/samba/var/lib
```

**NOTE: If you are using the install.sh script, all necessery folders will be created automatically for you. For now there is no option to change these if you are using the script.**

**NOTE: For now this project can't utilize network shares on it's own. If you want to store your media on a share you will have to set it up yourself and use the options in the .env to point them in the right locations.** 

## Applicatiion Specific Settings
Here you can change the name of the containers and the port that they will be accessable on.
I recommend you keep these setting as is.
All containers are named properly and all of them use the original ports.
You can see a list of all services and their ports [here](ports.md).