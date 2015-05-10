#!/bin/bash
# Install the tools on Fedora OS

##============================
## 安装gnome-tweak-tool设置工具
##============================
## 窗口的右上角就有最大化和最小化按钮
## 在日历中显示星期
## 设置桌面快捷方式
sudo yum install gnome-tweak-tool.noarch

##============================
## 安装FTP客户端(Filezilla)：
##============================
sudo yum install filezilla

##============================ 
## 安装flash插件(32位)：
##============================
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
sudo yum install flash-plugin

##============================ 
## 安装flash插件(64位)：
##============================
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo yum install flash-plugin

##============================
## 为右键菜单添加“在终端中打开”选项
##============================
sudo yum install nautilus-open-terminal

##============================
## 安装五笔输入法（ibus）
##============================
$ sudo yum list | grep wubi               #查看有哪些五笔输入法
ibus-table-chinese-wubi-haifeng.noarch   1.8.2-1.fc21                   fedora  
ibus-table-chinese-wubi-jidian.noarch    1.8.2-1.fc21                   fedora 

$ sudo yum install ibus-table-chinese-wubi-haifeng   #安装海峰五笔， 之后设置 Tweak tools,将输入法切换快捷键设置为 ctrl+shift

##============================
## 卸载系统自带的Ibus输入法
##============================
# sudo yum remove ibus
# gsettings set org.gnome.settings-daemon.plugins.keyboard active false

##============================
## 安装Fcitx输入法并安装搜狗资源包
##============================
## 全部安装
sudo yum install fcitx*

## 安装Fcitx Qt库，才能在Qt程序里面输入：
sudo yum -y install fcitx-qt4.i686 

# 配置一下Fcitx、在 /etc/profile or ~/.bashrc中添加:如下内容
export GTK_IM_MODULE=fcitx  
export QT_IM_MODULE=fcitx  
export XMODIFIERS="@im=fcitx"
# 注销或重启后完成安装

## 查看一下你的輸入法目前的狀態,，應該要下面這樣：
$ imsettings-info 
Xinput file: /etc/X11/xinit/xinput.d/fcitx.conf
GTK+ immodule: fcitx
Qt immodule: fcitx
XMODIFIERS: @im=fcitx
XIM server: /usr/bin/fcitx -D
Preferences: /usr/bin/fcitx-configtool 
Auxiliary:  
Short Description: FCITX
Long Description: 
Icon file: /usr/share/pixmaps/fcitx.png
Is system default: TRUE
Is user default: TRUE
Is XIM server: FALSE

## 因為 ibus 移除了，所以理論上應該 imsettings-info 出來就只有 fcitx 可以選，它應該會自已跳成 default ，
## 如果沒有的話，就乾脆安裝 im-chooser 來選擇 fcitx
sudo yum -y install im-chooser

### 运行[input Method Selector]， 选择[Use FCITX]之后，点[log Out]
### 打开[Fcitx Configuration]，在[Input Method Configuration]->[InputMethod]中添加[wubiPinyin]输入法，[Anthy]输入法以及键盘[Keyboard-English(US)]，[Keyboard-Japanese-Japanese(OADG109A)或者其他键盘布局]

### 安装搜狗资源包(no free)
### 从下面的连接地址下载对应的deb包、32位系统用i386.deb、64位系统用amd64.deb
### http://mirrors.ustc.edu.cn/deepin/pool/non-free/f/fcitx-sogoupinyin-release/

### 下载完成之后双击打开amd64.deb、蒋里面的data.tar.bz提取出来、然后到解压压缩文件
### sudo tar zxvf data.tar.gz -C /
### 接着我们把解压出来的.so文件移动到Fcitx的指定目录即可(64位为例)
### cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx/
### 最后加上执行权限
### chmod +x /usr/lib64/fcitx/fcitx-sogoupinyin.so


##============================
## 安装多媒体播放器（vlc）
##============================
sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo yum install vlc

##============================
## 安装音乐播放器
##============================
yum install audacious
yum install audacious-plugins-freeworld  #安装mp3解码器，需要RPM Fusion，参照【安装多媒体播放器（vlc）】

##============================
## 字体设置-安装文泉驿微米黑为例
##============================
sudo mkdir /usr/share/fonts/wqy-microhei  #建立字体目录
wget http://sourceforge.net/projects/wqy/files/wqy-microhei/0.2.0-beta/wqy-microhei-0.2.0-beta.tar.gz
tar -zxvf wqy-microhei-0.2.0-beta.tar.gz  #将下载的字体解压
cd wqy-microhei/
sudo mv wqy-microhei.ttc /usr/share/fonts/wqy-microhei
fc-cache -fv    #更新字体缓存
## windows下常见字体：http://pan.baidu.com/share/link?shareid=416052812&uk=2399426884
## 推荐字体：文泉驿正黑体和google-droid-sans-fonts

## 很多字体在fedora上显示的都很模糊，使用开源字体渲染软件Infinality来解决
sudo rpm -Uvh http://www.infinality.net/fedora/linux/infinality-repo-1.0-1.noarch.rpm
sudo yum install freetype-infinality fontconfig-infinality
vim /etc/profile.d/infinality-settings.sh   #设置渲染风格，默认的default就很清晰了
……
USE_STYLE="DEFAULT"

## 关于Infinality的用法：
sudo vim /etc/profile.d/infinality-settings.sh  #设置渲染风格，有win7/winXP/linux/osx等
sudo vim sudo vim /etc/fonts/infinality/styles.conf.avail/win7/20-aliases-default-win.conf #修改win7风格下的字体
## 在Infinality配置文件中设置字体的时候，可能需要获得字体的名称，如果中文字体要怎么设置名称呢？首先安装fontconfig软件包，然后在程序中找到“字体查看器”，这时候就可以找到中文字体的英文名称了。

##============================
## 添加自定义启动脚本
##============================
## 不知道从哪个版本起，Fedora里面没有/etc/rc.local了。要自定义启动脚本，可以做如下操作：sudo touch /etc/rc.d/rc.local
sudo chmod +x /etc/rc.d/rc.local
sudo ln -s /etc/rc.d/rc.local /etc/rc.local
sudo systemctl start rc-local.service
sudo systemctl enable rc-local.service
sudo systemctl status rc-local.service

##============================
## Error Fix
##============================
## 可能出现的错误：
## 从Linux系统远程连接后，打开图形界面时，提示：Gtk-Message: Failed to load module “pk-gtk-module”
## 解决办法：yum install PackageKit-gtk3-module






