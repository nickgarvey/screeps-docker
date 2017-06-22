# Screeps Dockerfile

This will start a local screeps server and will bind the port to a random one on the source host.

Only system requirements is installed Docker and a steam key from http://steamcommunity.com/dev/apikey

## Usage:

  docker build -t screeps-image --build-arg steamkey=YOURSTEAMKEYHERE .
  docker run -dP --name screeps-server screeps-image


  # to kill
  docker kill screeps-server

  # to find which port to connect to
  docker ports screeps-server

  # to use CLI
  docker exec -it screeps-server screeps cli

