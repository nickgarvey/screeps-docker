FROM node:6.11
RUN apt update && apt install vim --yes

WORKDIR /screeps
RUN npm install screeps

WORKDIR /screeps/node_modules/@screeps/launcher/
COPY ./installhook.patch ./
RUN patch -p1 < installhook.patch

WORKDIR /screeps/node_modules/@screeps/launcher/init_dist
RUN npm install screepsmod-tickrate

WORKDIR /screeps

ARG steamkey
# steamkey is necessary or screeps refuses to bind to 0.0.0.0
RUN test -n "$steamkey" && echo "$steamkey" | /screeps/node_modules/screeps/bin/screeps.js init

# server
EXPOSE 21025

COPY entrypoint.sh /screeps

ENTRYPOINT ["bash", "entrypoint.sh"]
