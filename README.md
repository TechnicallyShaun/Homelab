# Homelab
> A bunch of scripts and helpers to setup a home lab.

## Server
Common configuration for each server.

✅ [Install Ubuntu Server](https://ubuntu.com/download/server)

### Docker
On each of our machines that need it, Docker can be installed by running the following script:

`source <(curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh)` \
or \
`curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh | bash -s`

(may need sudo for above..)


## Networking Server

✅ Docker

Then run these commands:

    # Download the docker compose file for networking and rename on client
    wget  -O /docker/docker-compose.yml "https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.networking.yml"

    # Change directory to download location and run the services
    cd /docker/
    docker compose up



<br><br>
<br><br>
<br><br>
<br><br>

## Notes
### Scripts
This script can be used for passing parameters to the script
`curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh | bash -s arg1 arg2`