FROM ubuntu:saucy

RUN apt-get -y -qq update &&\
    apt-get install -y -q software-properties-common wget unzip iptables &&\
    add-apt-repository -y ppa:chris-lea/node.js &&\
    apt-get update -y &&\
    mkdir -p /usr/share/desktop-directories &&\
    apt-get install -y -q openjdk-7-jre-headless nodejs x11vnc xvfb  lib32ncurses5 libgtk2.0-0 libgconf-2-4 libasound2 &&\
    npm install -g selenium-standalone@2.44.0-7 &&\
    apt-get install -y -q xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic &&\
    wget "https://github.com/atom/atom-shell/releases/download/v0.20.8/atom-shell-v0.20.8-linux-x64.zip" &&\
    unzip atom-shell-v0.20.8-linux-x64.zip &&\
    useradd -d /home/chromeuser -m chromeuser &&\
    mkdir -p /home/chromeuser/Conferencing/Application &&\
    chown -R chromeuser /home/chromeuser/Conferencing &&\
    chgrp -R chromeuser /home/chromeuser/Conferencing &&\
    ln -s /atom /usr/bin/google-chrome &&\
    apt-get clean

ADD ./scripts/ /home/root/scripts

EXPOSE 4444 5999

ENTRYPOINT ["sh", "/home/root/scripts/start.sh"]
