FROM node:6.11

RUN npm install -g screeps

# no steamkey is fine if we don't care about auth
ARG steamkey
RUN test -n "$steamkey" && echo "$steamkey" | screeps init

# server
EXPOSE 21025

ENTRYPOINT ["screeps", "start"]
