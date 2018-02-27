Ant
===

Ant docker image based on Debian Jessie and Oracle JDK 8.

# Description

This Ant docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Ant](http://ant.apache.org/bindownload.cgi)

# How to run the container

## Using docker

### Example 1: Run version check in Ant container 

1. Run the Ant container with the following command:
  ```
  docker run --rm chrisipa/ant -version
  ```

## Advanced topics

### Accept self signed SSL certificates from Ant JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)  