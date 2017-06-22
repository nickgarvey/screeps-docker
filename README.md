# Screeps Dockerfile

This will start a local screeps server and will bind the port to a random one on the source host.

Only system requirements is installed Docker and a steam key from http://steamcommunity.com/dev/apikey

## Usage:

    docker build -t screeps-image --build-arg steamkey=YOURSTEAMKEYHERE .
    docker run -dP --name screeps-server screeps-image


### Stop the server
    docker kill screeps-server

### Find which port to connect to
    docker port screeps-server

### Use the CLI
    docker exec -it screeps-server screeps cli
