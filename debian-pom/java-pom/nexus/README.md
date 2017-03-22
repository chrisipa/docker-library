Nexus
==============

Nexus docker image based on Debian Jessie and Oracle JDK 8.

# Description
This Nexus docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Nexus Repository Manager OSS](http://www.sonatype.org/nexus/go/)


## Ports
This Nexus port is exposed:

  - 8081 (GUI)


# How to run the container

## Environment variables

When you start the Nexus container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `NEXUS_ADDITIONAL_JAVA_OPTS`

 - The additional options for the java process
 - Default value: 

### `NEXUS_CONTEXT_PATH`

 - The webapp context path as string
 - Default value: `/`

### `SONATYPE_WORK`

 - The folder for sonatype working data
 - Default value: `/opt/sonatype-work`

## Using docker

### Example 1: Evaluation usage without persistent data

1. Run Nexus container with this command:
  ```
  docker run -d -p 8081:8081 chrisipa/nexus
  ```

### Example 2: Production usage with mounted volume and context path

1. Create a folder for Sonatype work data on the docker host:
  ```
  sudo mkdir -p /opt/docker/sonatype-work
  ```

2. Run Nexus container with this command:
  ```
docker run -d --name nexus -p 8081:8081 -v /opt/docker/sonatype-work:/opt/sonatype-work chrisipa/nexus
  ```

## Advanced topics

### Accept self signed SSL certificates from Nexus JRE

See parent image: [chrisipa/java](https://github.com/chrisipa/docker-java#accept-self-signed-ssl-certificates-from-jre)
