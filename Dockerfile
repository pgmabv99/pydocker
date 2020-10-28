FROM python:3

#external software install + users + home folder
COPY authorized_keys /tmp/
COPY dinit_root.sh /tmp/
RUN chmod +x  /tmp/dinit_root.sh && /tmp/dinit_root.sh

USER pgmabv
#get our sft
WORKDIR /home/pgmabv
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyutil
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pyazure
RUN git clone  https://pgmabv99:Lena8484Lena8484@github.com/pgmabv99/pydjango
#connect python packages
ENV PYTHONPATH="/home/pgmabv/pyazure:/home/pgmabv/pyutil"
ENV PATH=".:${PATH}"

#test install
WORKDIR /home/pgmabv/pyazure
RUN python az_main.py

COPY pdjrun.sh  /home/pgmabv/pydjango/
RUN sudo chmod +x /home/pgmabv/pydjango/pdjrun.sh
WORKDIR /home/pgmabv/pydjango
# EXPOSE 8000
# EXPOSE 22
