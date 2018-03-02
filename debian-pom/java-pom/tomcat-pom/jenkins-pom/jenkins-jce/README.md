Jenkins (JCE)
=============

Jenkins docker image with useful tools for Java development with Maven builds including JCE.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/tomcat-pom/jenkins-pom/jenkins-jce).

# Description
This Jenkins docker image contains the following software components:

 - [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
 - [Java Cryptography Extension](http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html)
 - [Apache Maven 3](https://maven.apache.org/download.cgi)
 - [Apache Tomcat 9](https://tomcat.apache.org/index.html)
 - [Jenkins](https://jenkins-ci.org/)


## Ports
These Jenkins ports are exposed:

  - 8080 (GUI)
  - 50000 (Build agents)


# How to run the container

## Using docker

* See parent image: [chrisipa/jenkins](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/tomcat-pom/jenkins-pom/jenkins#using-docker)

## Advanced topics

### Use your own SSL certificates

See parent image: [chrisipa/tomcat](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/tomcat-pom/tomcat#use-your-own-ssl-certificates)

### Accept self signed SSL certificates from Jenkins JRE

See parent image: [chrisipa/jdk](https://github.com/chrisipa/docker-library/tree/master/debian-pom/java-pom/jdk#accept-self-signed-ssl-certificates-from-jre)
