FROM python:3.11.4-slim

# install basics
RUN apt-get update && apt-get install curl gcc git zip unzip -y

# install ttyd
RUN curl -LO https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64
RUN chmod +x ./ttyd.x86_64
RUN mv ./ttyd.x86_64 /usr/local/bin/ttyd

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install external libraries
RUN pip install --upgrade pip
RUN pip install awscli==1.29.16

# install cli
RUN pip install vessl==0.1.144

# install rsync
RUN apt-get install rsync -y
ADD krsync /usr/local/bin/

ENTRYPOINT ["/bin/sh"]
