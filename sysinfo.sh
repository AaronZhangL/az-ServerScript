echo "=================================="
echo "==    View System Information   =="
echo "=================================="
echo "== lscpu =="
# The lscpu command reports information about the cpu and processing units. It does not have any further options or functionality.
lscpu
echo "== lshw =="
# yum install lshw
# A general purpose utility, that reports detailed and brief information about multiple different hardware units such as cpu, memory, disk, usb controllers, network adapters etc. Lshw extracts the information from different /proc files.
lshw
echo "== hwinfo =="
# Hwinfo is another general purpose hardware probing utility that can report detailed and brief information about multiple different hardware components, and more than what lshw can report.
#------------Install hwinfo on Fedora20            -----------------------
# sudo wget http://download.opensuse.org/repositories/home:/zhonghuaren/Fedora_20/home:zhonghuaren.repo -O /etc/yum.repos.d/rpm-sphere.repo
# yum list hwinfo
# yum install hwinfo
#------------Install hwinfo on CentOS5/6 or EL 5/6 -----------------------
# CentOS 6
# rpm -Uvh http://mirror.symnds.com/distributions/gf/el/6/gf/x86_64/gf-release-6-6.gf.el6.noarch.rpm

# Centos 5
# rpm -Uvh http://mirror.symnds.com/distributions/gf/el/5/gf/x86_64/gf-release-5-6.gf.el5.noarch.rpm
#-------------------------------------------------------------------------
# hwinfo --help
hwinfo
echo "== lspci =="
lspci
echo "== lsscsi =="
lsscsi
echo "== lsusb =="
lsusb
echo "== inxi -Fx =="
inxi -Fx
echo "== lsblk =="
lsblk
echo "== df -H =="
df -H
echo "== pydf =="
pydf
echo "== fdisk =="
sudo fdisk -l
echo "== free -m =="
free -m
echo "== dmidecode =="
# display information about the processor/cpu
sudo dmidecode -t processor
# memory/ram information
$ sudo dmidecode -t memory
# bios details
sudo dmidecode -t bios
echo "== /proc files =="
# cpu information
cat /proc/cpuinfo
# memory information
cat /proc/meminfo
#Linux/kernel information
cat /proc/version
#SCSI/Sata devices
cat /proc/scsi/scsi
#Partitions
cat /proc/partitions
echo "== hdparam =="
sudo hdparm -i /dev/sda
echo "=================================="
