FROM node:6.11
RUN apt update && apt install vim --yes

WORKDIR /screeps
RUN npm install screeps

# steamkey is necessary or screeps refuses to bind to 0.0.0.0
ARG steamkey
RUN test -n "$steamkey" && echo "$steamkey" | /screeps/node_modules/screeps/bin/screeps.js init

RUN npm install screepsmod-tickrate

# server port only
# not exposing cli, just use docker exec locally
EXPOSE 21025

COPY entrypoint.sh /screeps

ENTRYPOINT ["bash", "entrypoint.sh"]
