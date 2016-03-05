#-------------------------------------------------------------------------------
# Install git
#-------------------------------------------------------------------------------
yum -y install git

#-------------------------------------------------------------------------------
# Install nodejs
#-------------------------------------------------------------------------------
# See: https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora
#Alternatively for Node.js v5:
yum clean all
curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
yum -y install nodejs

node --version
#= v5.7.1
