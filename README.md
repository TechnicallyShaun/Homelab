# Homelab
> Instructions, scripts and helpers to setup a home lab.


## Server
Common configuration for each server.

✅ [Install Ubuntu Server](https://ubuntu.com/download/server)

*Don't forget to `chmod` where needed*

### Docker
On each machine that needs it, Docker can be installed by running the following script:

    source <(curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh)

    sudo groupadd docker
    sudo usermod -aG docker $USER

### Docker Compose
Each server that has a Compose file uses the same steps in order to initialise:

    # Download the docker compose file and rename for convention
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.SERVERTYPE.yml --create-dirs -o /docker/docker-compose.yml

    # Change permissions on directory (only needs 1)
    sudo chown -R $USER:$USER /docker
    sudo chmod 777 -R /docker

    # Run the services
    cd /docker/
    sudo docker compose up -d

### Git Config
Development servers and devices that sync config to GitHub will require Git Config:

    git config --global user.name Smithy
    git config --global user.email EMAIL
    git config --global pull.rebase false


## Networking Server
Networking server has reverse proxy (and TODO PiHole).

✅ Install Docker

✅ Docker Compose config (Section above)

    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.networking.yml --create-dirs -o /docker/docker-compose.yml

After installing NGINX GoDaddy seems to brick the Add Certificate function. Following this post resolves the issue:

https://www.reddit.com/r/nginxproxymanager/comments/166fbka/certbot_renew_internal_error/jze9sgw/?context=3


## Home Automation Server

✅ Install Docker

✅ Docker Compose config (Section above)

    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.homeautomation.yml --create-dirs -o /docker/docker-compose.yml

    # Download environment vars file
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/homeautomation.env --create-dirs -o /docker/.env

*Replace the values in the .env file, and then run `docker compose up -d`*

✅ Install unzip

It's easier to transfer the zip to this server and then unpack, so installing unzip here is needed

    sudo apt-get install unzip -y

## Utilites Server

✅ Install Docker

✅ Docker Compose config (Section above)

    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.utilities.yml --create-dirs -o /docker/docker-compose.yml

### Net Daemon Updater
Several packages and configuration are required to allow the updater script to run:

✅ Install jq `sudo apt-get install jq -y`

✅ Install unzip `sudo apt-get install unzip -y`

This script can be called periodically, or via push notification, (TODO: and will check for a new version before updating)

> This script requires permissions on local and remote.

    sudo bash ./UpdateNetDaemon.sh

### SSH Public Key Authentication
Configure SSH Private/Public Key authentication between local server and remote server (i.e. Utilities -> Automation):

    # Generate keys
    ssh-keygen

    # Copy public key to server
    ssh-copy-id user@server
    # enter password

    # Login
    ssh user@server


<br><br>
<br><br>
<br><br>
<br><br>

## Notes
### Scripts
This script can be used for passing parameters to the script
`curl -s https://raw.githubusercontent.com/ssmithy/Homelab/main/InstallDocker.sh | bash -s arg1 arg2`
