#!/bin/bash
# Mount shared folder

echo "Mount shared folder to [/mnt/disk2/02_shareFolder]."

mount -t vboxsf -o uid=amiroot,gid=amiroot 02_shareFolder /mnt/disk2/02_shareFolder
