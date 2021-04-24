FROM debian:buster-slim
RUN apt-get update && apt-get install -y \
    && apt-get install -y wget 

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN wget https://github.com/atauenis/webone/releases/download/v0.10.3/WebOne.0.10.3.linux-x64.deb -O webone.deb
RUN apt-get install ./packages-microsoft-prod.deb && apt-get update && apt-get install ./webone.deb -y && rm -rf /var/lib/apt/lists/*

EXPOSE 6969/tcp

RUN sed -i 's/^LogFile=/;LogFile=/g' /etc/WebOne/webone.conf
ENTRYPOINT WebOne 6969 --log=no
