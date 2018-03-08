Sonatype Nexus
==============

Nexus docker image based on Debian Jessie and Oracle JDK 8.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/nexus).

# Description
This Nexus docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)
 - [Nexus Repository Manager OSS](http://www.sonatype.org/nexus/go/)


## Ports
These Nexus ports are exposed:

  - 8081 (GUI)
  - 8082 (Docker Registry)


# How to run the container

## Environment variables

When you start the Nexus container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `INSTALL4J_ADD_VM_PARAMS`

 - The additional options for the java process
 - Default value: `-Xms1200m -Xmx1200m -XX:MaxDirectMemorySize=2g -Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs`

### `NEXUS_CONTEXT_PATH`

 - The webapp context path as string
 - Default value: `/`

### `NEXUS_SESSION_TIMEOUT`

 - The session timeout of the nexus webapp in milliseconds
 - Default value: `600000`

### `SONATYPE_WORK`

 - The folder for sonatype working data
 - Default value: `/opt/sonatype-work`

## Using docker

### Preparation: Create a underprivileged user on the host system

1. Create group and user:
  ```
  sudo groupadd -g 1001 chrisipa
  sudo useradd -u 1001 -g 1001 -m -s /usr/sbin/nologin chrisipa
  ```  

### Example 1: Evaluation usage without persistent data

1. Run Nexus container with this command:
  ```
  docker run --rm -p 8081:8081 chrisipa/nexus
  ```

### Example 2: Production usage with mounted volume and context path

1. Create a folder for Sonatype work data on the docker host:
  ```
  sudo mkdir -p /opt/sonatype-work
  sudo chown 1001.1001 /opt/sonatype-work
  ```

2. Run Nexus container with this command:
  ```
docker run -d --name nexus -p 8081:8081 -v /opt/sonatype-work:/opt/sonatype-work chrisipa/nexus
  ```
  
### Example 3: Real world usage running docker-compose

1. Create docker compose file `docker-compose.yml` with your configuration data:
  ```yml
  nexus:
    image: chrisipa/nexus:latest
    volumes:    
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
      - /opt/sonatype-work:/opt/sonatype-work
    ports:
      - 8081:8081
  ```

2. Run docker containers with docker compose:
  ```
  docker-compose up -d
  ```  

## Advanced topics

### Accept self signed SSL certificates from Nexus JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)
