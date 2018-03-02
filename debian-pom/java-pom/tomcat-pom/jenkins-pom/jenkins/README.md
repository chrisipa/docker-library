Jenkins
==============

Jenkins docker image with useful tools for Java development with Maven builds.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/tomcat-pom/jenkins-pom/jenkins).

# Description
This Jenkins docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)
 - [Apache Tomcat 9](https://tomcat.apache.org/index.html)
 - [Jenkins](https://jenkins-ci.org/)


## Ports
These Jenkins ports are exposed:

  - 8080 (GUI)
  - 50000 (Build agents)


# How to run the container

## Using docker

### Preparation: Create a underprivileged user on the host system

1. Create group and user:
  ```
  sudo groupadd -g 1001 chrisipa
  sudo useradd -u 1001 -g 1001 -m -s /usr/sbin/nologin chrisipa
  ```  

### Example 1: Evaluation usage without persistent data

1. Run Jenkins container with this command:
  ```
  docker run --rm -p 8080:8080 -p 50000:50000 chrisipa/jenkins
  ```

### Example 2: Production usage with mounted volume and context path

1. Create a folder for Jenkins data on the docker host:
  ```
  sudo mkdir -p /opt/jenkins
  sudo chown 1001.1001 /opt/jenkins
  ```

2. Run Jenkins container with this command:
  ```
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /opt/jenkins:/opt/jenkins chrisipa/jenkins
  ```

## Advanced topics

### Use your own SSL certificates

See parent image: [chrisipa/tomcat](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/tomcat-pom/tomcat#use-your-own-ssl-certificates)

### Accept self signed SSL certificates from Jenkins JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)
