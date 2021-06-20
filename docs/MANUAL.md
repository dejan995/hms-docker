# Editing the .env File
## User and Group ID
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

## Time Zone
This is to set the correct Time Zone to the applications that need it.

You can see all available time zones [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). Look in the third column of the table - "TZ database name"

Since I'm in Macedonia I'm using "Europe/Skopje" - Skopje is the capital city of my country.
```code
TIME_ZONE=Europe/Skopje
```