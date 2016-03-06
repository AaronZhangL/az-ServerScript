#-------------------------------------------------------------------------------
# docker mysql server
# See: https://hub.docker.com/r/mysql/mysql-server/
#-------------------------------------------------------------------------------

### MySQL Server Docker Images
# These are optimized MySQL Server Docker images, created and maintained by the MySQL team at Oracle. The available versions are:

# MySQL Server 5.5 (tag: 5.5)
# MySQL Server 5.6 (tag: 5.6)
# MySQL Server 5.7, the latest GA version (tag: 5.7 or latest)

### How to Use the MySQL Images
# Start a MySQL Server Instance

docker run --name my-container-name -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql/mysql-server:tag

# sample: run mysql server
docker run --name gdt-programo -e MYSQL_ROOT_PASSWORD=xxxxx -d mysql/mysql-server:latest

# Connect to MySQL from an Application in Another Docker Container
docker run --name app-container-name --link my-container-name:mysql -d app-that-uses-mysql

# sample
docker run --name gdt_prowebs --link gdt-programo -d az:prowebs

# Connect to MySQL from the MySQL Command Line Client

docker run -it --link my-container-name:mysql --rm mysql/mysql-server:tag sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

# Container Shell Access and Viewing MySQL Log Files

docker exec -it my-container-name bash

more /var/log/mysqld.log

#+++++++++++++++++++++++++++++++++++++++++
#Dockerfile
#- FROM centos:centos7
#- RUN yum -y install git mysql
#- RUN mkdir /gdt
#- RUN cd /gdt; git clone https://github.com/xxx/xxx.git

# Build web server
docker build -t 'az:prowebs' .

# Run mysql server
docker run --name gdt_programo1 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=xxxx -d mysql/mysql-server:latest

# Run web server link to mysql server
docker run --name gdt-prowebs --link gdt-programo -d az1:prowebs

# phpmyadmin
docker run --name gdt-myadmin -d --link gdt-programo:db -p 8090:80 phpmyadmin/phpmyadmin

#+++++++++++++++++++++++++++++++++++++++++
#------------host machine, get mysql server contanier ip address-------------
TAG="mysql/mysql-server:latest"

CONTAINER_ID=$(docker ps | grep $TAG | awk '{print $1}')

echo $CONTAINER_ID

IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID)

echo $IP

#-----------access to mysql server contanier 172.17.0.3, add access user---------
CREATE USER 'admin'@'%' IDENTIFIED BY 'xxxx';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;


