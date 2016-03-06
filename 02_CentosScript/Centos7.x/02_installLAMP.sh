#-------------------------------------------------------------------------------
# Install Apache, PHP And MySQL On CentOS 7 (LAMP) 
# See: https://www.howtoforge.com/apache_php_mysql_on_centos_7_lamp
#-------------------------------------------------------------------------------

# I will add EPEL-7 repo here to install latest phpMyAdmin as follows:
#- rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

#- yum -y install mysql-client
#- yum -y install httpd
#- systemctl start httpd.service
#- systemctl enable httpd.service
#- firewall-cmd --permanent --zone=public --add-service=http
#- firewall-cmd --permanent --zone=public --add-service=https
#- firewall-cmd --reload
#- yum -y install php
#- yum -y php-mysql
#- yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel
#- systemctl restart httpd.service

# vi /var/www/html/info.php
#- <?php
#- phpinfo();
#- ?>

#+++++++++++++++++++++++++++++++++++++++++
# See: https://hub.docker.com/_/httpd/
### Create a Dockerfile in your project
#- FROM httpd:2.4
#- COPY ./public-html/ /usr/local/apache2/htdocs/

#- docker build -t my-apache2 .
#- docker run -it --rm --name my-running-app my-apache2
