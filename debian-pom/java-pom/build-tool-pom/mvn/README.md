Maven
=====

Maven docker image based on Debian Jessie and Oracle JDK 8.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/build-tool-pom/mvn).

# Description

This Maven docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)

# How to run the container

## Using docker

### Preparation: Create a underprivileged user on the host system

1. Create group and user:
  ```
  sudo groupadd -g 1001 chrisipa
  sudo useradd -u 1001 -g 1001 -m -s /usr/sbin/nologin chrisipa
  ``` 

### Example 1: Run version check in Maven container 

1. Run the Maven container with the following command:
  ```
  docker run --rm chrisipa/mvn -version
  ```
  
### Example 2: Run project build in Maven container   

1. Change permissions on your project folder:
  ```
  sudo chown -R 1001.1001 $(pwd)
  ```  

2. Run the Maven container with the following command:
  ```
  docker run --rm -v $(pwd):/build chrisipa/mvn clean install  
  ```  

## Advanced topics

### Accept self signed SSL certificates from Maven JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)