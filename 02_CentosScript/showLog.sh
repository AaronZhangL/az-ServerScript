#查看linux下的用户登录日志
more /var/log/secure

#查看谁登录
who /var/log/wtmp


#干了些什么？
#root账户下输入su - username
#切换到username下输入
history
#能看到这个用户历史命令，默认最近的1000条

echo "----------list /var/run/utmp------------------"
utmpdump /var/run/utmp

echo "----------list /var/log/wtmp------------------"
utmpdump /var/log/wtmp
