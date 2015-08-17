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

## Linux Command Alias 
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias rm='rm -i'

## 安装Fcitx输入法
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
##=====================================
## Set Terminal Color 
##=====================================
# Shorten home dir, cygwin drives, paths that are too long
# (just bourne; no perl, sed, or bashisms!)
function PSWD() {
  local p="$*" parta partb
  if [ "$p" = "${HOME:-empty}${p#$HOME}" ]
    then p="~${p#$HOME}"
  fi
  # Fix Cygwin drive designations
  if [ "$OS" != "${OS#*CYGWIN}" -a "${p#/cygdrive}" != "$p" ]; then
    p="${p#/cygdrive/}"
    parta="${p%%/*}"
    if [ -z "$parta" ]
      then p="$p:"
      else p="$parta:${p#?}"
    fi
  fi
  # if the resulting path is 34+ characters, truncate it
  parta="${p#??????????????????????????????????}"
  if [ "${parta:-$p}" != "$p" ]; then
    parta="${p#??????????}"     # the path, minus the first 10 chars
    parta="${p%$parta}"         # the first 10 chars of the path
    partb="${p%????????????????????}"   # the path, minus the last 20 chars
    partb="${p#$partb}"         # the last 20 chars of the path
    p="$parta...$partb"         # 10 chars plus 3 dots plus 20 chars = 33
  fi
  echo "$p"
}

PSC() { echo -ne "\[\033[${1:-0;38}m\]"; }
PR="0;32"       # default color used in prompt is green
if [ "$(id -u)" = 0 ]; then
    sudo=41     # root is red background
  elif [ "$USER" != "${SUDO_USER:-$USER}" ]; then
    sudo=31     # not root, not self: red text
  else sudo="$PR"   # standard user color
fi
PROMPT_COMMAND='[ $? = 0 ] && PS1=${PS1[1]} || PS1=${PS1[2]}'
PSbase="$(PSC $sudo)\u$(PSC $PR)@\h $(PSC 33)\$(PSWD \w)"
PS1[1]="$PSbase$(PSC $PR)\$ $(PSC)"
PS1[2]="$PSbase$(PSC  31)\$ $(PSC)"
PS1="${PS1[1]}"
unset sudo PR PSbase
##=====================================
## Add by Aaron.Z end
##=====================================
