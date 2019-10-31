FROM ubuntu:16.04

# Author Info
MAINTAINER ____easy

RUN apt-get update
RUN apt-get install -y curl

# install nginx
RUN touch /etc/apt/sources.list.d/nginx.list
RUN echo "deb http://nginx.org/packages/ubuntu/ precise nginx" >> /etc/apt/sources.list.d/nginx.list
RUN echo "deb-src http://nginx.org/packages/ubuntu/ precise nginx" >> /etc/apt/sources.list.d/nginx.list
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add -
RUN apt-get update
RUN apt-get install -y nginx

# set working directory
WORKDIR /root

# Port
EXPOSE 22 80 

# change default html file of nginx
COPY ./html /usr/share/nginx/html