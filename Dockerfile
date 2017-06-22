FROM node:6.11

RUN npm install -g screeps

ARG steamkey
# steamkey is necessary or screeps refuses to bind to 0.0.0.0
RUN test -n "$steamkey" && echo "$steamkey" | screeps init

# server
EXPOSE 21025

ENTRYPOINT ["screeps", "start"]
