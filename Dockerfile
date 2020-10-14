FROM python:3
RUN mkdir aprj
WORKDIR /aprj
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyutil
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyazure
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pydjango

RUN ls -ltr

#no need venv in container
# WORKDIR /aprj/pyazure
# RUN python -m venv azure
# RUN /bin/sh source azure/bin/activate

RUN apt-get update -y

# RUN apt-get install -y unixodbc-dev  mssql-tools


RUN apt-get install curl
RUN apt-get install apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list

RUN apt-get update
ENV ACCEPT_EULA=y DEBIAN_FRONTEND=noninteractive
RUN apt-get install mssql-tools unixodbc-dev -y

RUN pip list
RUN pip install pyodbc
RUN pip install azure-core 
RUN pip install azure-cosmos 
RUN pip install Django
# RUN pip install pandas
RUN pip list

ENV PYTHONPATH="/aprj/pyutil"
WORKDIR /aprj/pyazure
RUN python az_main.py


