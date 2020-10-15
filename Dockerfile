FROM python:3

#install ssh and try to enable
RUN apt-get update -y &&\
    apt-get install ssh -y &&\
    echo  "    PermitRootLogin yes">>/etc/ssh/ssh_config &&\
    cat /etc/ssh/ssh_config

RUN update-rc.d ssh defaults
RUN systemctl enable ssh


#get  odbc
RUN apt-get update -y 
RUN apt-get install curl
RUN apt-get install apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
ENV ACCEPT_EULA=y DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y 
RUN apt-get install mssql-tools unixodbc-dev -y

# python packages
RUN pip install pyodbc
RUN pip install azure-core 
RUN pip install azure-cosmos 
RUN pip install Django
# todo too logn /RUN pip install pandas
RUN pip list

#create user /group /copy ssh keys
RUN groupadd -g 999 pgmabv && \
    useradd -m -r -u 999 -g pgmabv pgmabv &&\
    mkdir /home/pgmabv/.ssh 
COPY authorized_keys /home/pgmabv/.ssh/
RUN chown -R  pgmabv /home/pgmabv/ 
RUN apt-get install sudo -y
#add to sudogoup
# RUN echo 'pgmabv:mark84' | chpasswd
RUN usermod -a -G sudo pgmabv
#prey to not prompt pass on sudo
RUN echo "%sudo  ALL=(ALL) NOPASSWD:ALL">>/etc/sudoers

RUN mkdir aprj&& \
    chown -R  pgmabv /aprj
USER pgmabv

#get our
WORKDIR /home/pgmabv
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyutil
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyazure
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pydjango
#connect python packages
ENV PYTHONPATH="/home/pgmabv/pyazure:/home/pgmabv/pyutil"

#test install
WORKDIR /home/pgmabv/pyazure
RUN python az_main.py

COPY pdjrun.sh  /home/pgmabv/pydjango/
WORKDIR /home/pgmabv/pydjango
