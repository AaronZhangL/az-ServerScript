## =============================
## Converting a putty ppk file to a pem file 
## for accessing AWS ec2 instances
## =============================
## Sample ppk file name is privatekey.ppk
## The result file is privatekey.pem
sudo yum install putty
puttygen privatekey.ppk -O private-openssh -o privatekey.pem
chmod go-rw privatekey.pem
ssh -i privatekey.pem ec2-user@my.server.com

