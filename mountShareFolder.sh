#!/bin/bash
# Mount shared folder

echo "Mount shared folder to [/mnt/disk2/02_shareFolder]."

mount -t vboxsf -o uid=amiroot,gid=amiroot 02_shareFolder /mnt/disk2/02_shareFolder

## Mount samba folder
sudo mount -t cifs -o username=[UserName],password=[Password] //xxx.xxx.xxx.xxx/bak/ /mnt/backupServer
