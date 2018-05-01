#Download base image ubuntu 14.04
FROM ubuntu:14.04

# Update Ubuntu Software repository
RUN apt-get update

ADD ./vimrc /root/.vimrc
ADD ./vim /root/.vim
ADD ./install.sh /root/
RUN /root/install.sh
