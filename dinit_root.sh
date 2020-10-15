#!/bin/bash
#to be run from dockerfile
#init external sw + user/group/folders
set -x
set -e


#install ssh and try to enable
apt-get update -y &&\
# apt-get install ssh -y &&\
apt-get install openssh-server -y &&\
echo  "    PermitRootLogin yes">>/etc/ssh/ssh_config &&\
cat /etc/ssh/ssh_config

update-rc.d ssh defaults
systemctl enable ssh


#get  odbc
apt-get update -y
apt-get install curl
apt-get install apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
apt-get update -y
export ACCEPT_EULA=y 
export DEBIAN_FRONTEND=noninteractive
apt-get install mssql-tools unixodbc-dev -y

# python packages
pip install pyodbc
pip install azure-core
pip install azure-cosmos
pip install Django
# todo too logn / pip install pandas
pip list

#create user /group /copy ssh keys
groupadd -g 999 pgmabv && \
useradd -m -r -u 999 -g pgmabv pgmabv &&\
mkdir /home/pgmabv/.ssh
cp /tmp/authorized_keys /home/pgmabv/.ssh/
chown -R  pgmabv /home/pgmabv/
apt-get install sudo -y
#add to sudogoup
#  echo 'pgmabv:mark84' | chpasswd
usermod -a -G sudo pgmabv
#prey to not prompt pass on sudo
echo "%sudo  ALL=(ALL) NOPASSWD:ALL">>/etc/sudoers
