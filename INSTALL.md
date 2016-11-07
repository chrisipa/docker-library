# Docker

## Prerequisities

### Increase os limits

* Edit limits config file:
    ```
    sudo nano /etc/security/limits.d/99-limits.conf

    *       soft    fsize   unlimited
    *       hard    fsize   unlimited
    *       soft    cpu     unlimited
    *       hard    cpu     unlimited
    *       soft    as      unlimited
    *       hard    as      unlimited
    *       soft    nofile  64000
    *       hard    nofile  64000
    *       soft    rss     unlimited
    *       hard    rss     unlimited
    *       soft    nproc   64000
    *       hard    nproc   64000
    ```

## Setup

### Docker daemon

* Add gpg-Key:
    ```
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    ```

* Add docker apt repositories:
    ```
    sudo nano /etc/apt/sources.list.d/docker.list

    deb https://apt.dockerproject.org/repo ubuntu-trusty main
    ```

* Update packages:
    ```
    sudo apt-get update
    ```

* Install docker-engine:
    ```
    sudo apt-get install -y docker-engine
    ```

* Allow your user to execute the docker command:
    ```
    sudo usermod -aG docker $USER
    ```

* Reboot your system:
    ```
    sudo reboot
    ```

* Read more:
https://docs.docker.com/engine/installation/linux/

## Caveauts

### Solve DNS problems in docker containers

* Edit docker config file:
    ```
    sudo nano /etc/default/docker
    ...
    DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"
    ...
    ```

* Restart docker daemon:
    ```
    sudo service docker restart
    ```

### rpc.statd is listening on a port reserved for a container

* Restart rpcbind daemon:
    ```
    sudo service rpcbind restart
    ```