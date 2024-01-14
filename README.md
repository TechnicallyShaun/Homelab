# Homelab
> Instructions, scripts and helpers to setup a home lab.

## Server
Common configuration for each server.

✅ [Install Ubuntu Server](https://ubuntu.com/download/server)

### Docker
On each of our machines that need it, Docker can be installed by running the following script:

`source <(curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh)`

### Git Config

`git config --global user.name Smithy`

`git config --global user.email EMAIL`

## Networking Server

✅ Install Docker

Then run these commands:

    # Download the docker compose file for networking and rename on client
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.networking.yml --create-dirs -o /docker/docker-compose.yml

    # Claim the directory and change to it
    sudo chown -R $USER:$USER /docker
    cd /docker/

    # Run the services
    sudo docker compose up -d

After installing NGINX GoDaddy seems to brick the Add Certificate function. Following this post resolves the issue:

https://www.reddit.com/r/nginxproxymanager/comments/166fbka/certbot_renew_internal_error/jze9sgw/?context=3

## Home Automation Server

✅ Install Docker

    # Download the docker compose file for home automation services and rename on client
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.homeautomation.yml --create-dirs -o /docker/docker-compose.yml

    # Claim the directory and change to it
    sudo chown -R $USER:$USER /docker
    cd /docker/

    # Run the services
    sudo docker compose up -d



<br><br>
<br><br>
<br><br>
<br><br>

## Notes
### Scripts
This script can be used for passing parameters to the script
`curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh | bash -s arg1 arg2`