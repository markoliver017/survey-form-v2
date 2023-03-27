# FROM node:latest
FROM node:16.13.1-alpine

RUN apk add -U subversion

WORKDIR /var/www/app

COPY package*.json ./

RUN npm install && npm cache clean --force

ENV PATH=/var/www/app/node_modules/.bin:$PATH

RUN mkdir -p /var/www/app/src

WORKDIR /var/www/app/src

COPY src .

EXPOSE 3000