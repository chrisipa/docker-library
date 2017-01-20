# Docker-Library

## Prerequisities

* [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Apache Maven 3](https://maven.apache.org/download.cgi)
* [Docker](INSTALL.md)

## Build

* Execute build script:
    ```
    Usage:
      ./build.sh [Options] <Args>

    Options:
      -h                    Print this help text
      -c                    Remove all docker containers and images
      -d                    Deploy docker images to docker registry
      -f                    Build docker images without build cache
      -p <project-list>     Build comma separated maven project list
      -s                    Create docker containers from images and start them
      -t <tag>              Build with specified image tag

    Examples:
      ./build.sh                                   Build all docker images
      ./build.sh -c                                Remove all docker containers and images
      ./build.sh -p debian,jdk                     Build only docker images for 'debian' and 'jdk'
      ./build.sh -p debian,jdk -t master -f        -> and tag with name 'master'
      ./build.sh -p debian,jdk -t master -f        -> and do not use docker build cache
      ./build.sh -p debian,jdk -t master -f -s     -> and start containers
      ./build.sh -p debian,jdk -t master -f -s -d  -> and deploy to docker registry
    ```

## Additional information

* https://github.com/fabric8io/docker-maven-plugin
* https://dmp.fabric8.io/