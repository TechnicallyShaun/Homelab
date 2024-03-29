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

    # Download config for ddns updater
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/ddnsupdater.config.json --create-dirs -o /docker/appdata/ddnsupdater/data/config.json

## GitHub Runner Server
After building and testing code on GitHub we will need to deploy to our local environment.

There's many ways to do this, we could:

- Deploy to local Docker Registry
- Custom Eventing system e.g. WebHook reciever or MQTT
- Selfhosted GitHub runner

This server focuses on the selfhosted GitHub runner solution, due to ease of use and seamless experience.

### Net Daemon Updater
Net Daemon updater is built using a Github selfhosted runner.

✅ [Install Runner](https://github.com/ssmithy/NetDaemon/settings/actions/runners/new)

- During installation make sure to give a unique label, so we can install multiple runners.

The [Continuous Deployment Workflow](https://github.com/ssmithy/NetDaemon/blob/main/.github/workflows/CD.yml) will then handle deployment to the Automation Server.

> Ensure that SSH Public Key Auth is configured between Runner and Automation servers.


### SSH Public Key Authentication
Configure SSH Private/Public Key authentication between local server and remote server (i.e. Utilities -> Automation):

    # Generate keys
    ssh-keygen

    # Copy public key to server
    ssh-copy-id user@server
    # enter password

    # Login
    ssh user@server


## Development Machine
I like to use a VM as a development machine. It's easier to setup, tear down and to port in from remote devices.

✅ Install Docker Desktop

✅ Install VS Code

✅ Docker Compose config (Section above)

    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.development.yml --create-dirs -o /docker/docker-compose.yml

    # Download environment vars file
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/development.env --create-dirs -o /docker/.env


# Testing
Here's some scripts I'm currently testing with:

### Budget Apps

    # Download the docker compose file and rename for convention
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/docker-compose.testing.yml --create-dirs -o /docker/docker-compose.yml
    
    # Download environment vars files
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/firefly.env --create-dirs -o /docker/.env
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/firefly.db.env --create-dirs -o /docker/.db.env
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/firefly.importer.env --create-dirs -o /docker/.importer.env
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/huginn.mysql.env --create-dirs -o /docker/.mysql.env
    sudo curl https://raw.githubusercontent.com/ssmithy/Homelab/main/huginn.secrets.env --create-dirs -o /docker/.secrets.env

    # Run the services
    cd /docker/
    sudo docker compose up -d