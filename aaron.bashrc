# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

##=====================================
## Add by Aaron.Z start
##=====================================
## 挂载与宿主机器的共享文件夹
sudo ~/01_projects/mountShareFolder.sh

## 安装Fcitx输入法
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
##=====================================
## Add by Aaron.Z end
##=====================================
