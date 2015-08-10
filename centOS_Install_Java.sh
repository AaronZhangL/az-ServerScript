#For 64bit JDK
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"

#For 64bit JRE
#http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-linux-x64.tar.gz
tar xzf jdk-8u45-linux-x64.tar.gz

#For 32bit JDK
#cd /opt/
#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-i586.tar.gz"

#For 32bit JRE
#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-linux-i586.tar.gz"
#http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-linux-i586.tar.gz

#tar xzf jdk-8u45-linux-i586.tar.gz

#Install Java with Alternatives
cd /opt/jdk1.8.0_45/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 2
alternatives --config java
#There are 3 programs which provide 'java'.
#
#  Selection    Command
#-----------------------------------------------
#*  1           /opt/jdk1.7.0_71/bin/java
# + 2           /opt/jdk1.8.0_25/bin/java
#   3           /opt/jdk1.8.0_45/bin/java
#
#Enter to keep the current selection[+], or type selection number: 3

alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_45/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_45/bin/jar
alternatives --set javac /opt/jdk1.8.0_45/bin/javac


